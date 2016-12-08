OPTION EXPLICIT

DIM FileName, multivaluedsep,strAttributes
DIM strFilter, strRoot, strScope
DIM cmd, rs,cn
DIM objRoot, objFSO,objCSV
DIM comma, q, i, j, mvsep, strAttribute, strValue

' ********************* Setup *********************

' The filename of the csv file produced by this script
FileName ="userexport.csv"
' Seperator used for multi-valued attributes
multivaluedsep = ";"
' comma seperated list of attributes to export
strAttributes = "sAMAccountName,givenName,initials,sn,displayName,description,physicalDeliveryOfficeName," & _
		"telephoneNumber,mail,wWWHomePage,cn"

' Default filter for all user accounts (ammend if required)
strFilter = "(&(objectCategory=person)(objectClass=user))"
' scope of search (default is subtree - search all child OUs)
strScope = "subtree"
' search root. e.g. ou=MyUsers,dc=wisesoft,dc=co,dc=uk
' leave blank to search from domain root
strRoot = ""

' *************************************************

q = """"

SET cmd = CREATEOBJECT("ADODB.Command")
SET cn = CREATEOBJECT("ADODB.Connection")
SET rs = CREATEOBJECT("ADODB.Recordset")

cn.open "Provider=ADsDSOObject;"
cmd.activeconnection = cn

'IF strRoot = "" THEN
'	SET objRoot = GETOBJECT("LDAP://RootDSE")
'	strRoot = objRoot.GET("defaultNamingContext") 
'END IF

'*************************************************
Set objRoot = GetObject("LDAP://rootDSE")
'strRoot = objRoot.Get("defaultNamingContext")
'***********************************************

'cmd.commandtext = "<LDAP://" & strRoot & ">;" & strFilter & ";" & _
'		  strAttributes & ";" & strScope


cmd.commandtext = "<LDAP://" & objRoot.Get("defaultNamingContext") & ">;" & strFilter & ";" & _
		  strAttributes & ";" & strScope

'**** Bypass 1000 record limitation ****
cmd.properties("page size")=1000

SET rs = cmd.EXECUTE
SET objFSO = CREATEOBJECT("Scripting.FileSystemObject")
SET objCSV = objFSO.createtextfile(FileName)

comma = "" ' first column does not require a preceding comma
i = 0 

' create a header row and count the number of attributes
FOR EACH strAttribute in SPLIT(strAttributes,",")
	objcsv.write(comma & q & strAttribute & q)
	comma = "," ' all columns apart from the first column require a preceding comma
	i = i + 1
NEXT

' for each item returned by the Active Directory query
WHILE rs.eof <> TRUE AND rs.bof <> TRUE
	comma="" ' first column does not require a preceding comma
	objcsv.writeline ' Start a new line
	' For each column in the result set
	FOR j = 0 to (i - 1)
		SELECT CASE TYPENAME(rs(j).value)
		CASE "Null" ' handle null value
			objcsv.write(comma & q & q)
		CASE "Variant()" ' multi-valued attribute
			' Multi-valued attributes will be seperated by value specified in
			' "multivaluedsep" variable
			mvsep = "" 'No seperator required for first value
			objcsv.write(comma & q)
			FOR EACH strValue in rs(j).Value
				' Write value
				' single double quotes " are replaced by double double quotes ""
				objcsv.write(mvsep & REPLACE(strValue,q,q & q))
				mvsep = multivaluedsep ' seperator used when more than one value returned
			NEXT
			objcsv.write(q)
		CASE ELSE
			' Write value
			' single double quotes " are replaced by double double quotes ""
			objcsv.write(comma & q & REPLACE(rs(j).value,q,q & q) & q)
		END SELECT
		
		comma = "," ' all columns apart from the first column require a preceding comma
	NEXT
	rs.movenext
WEND

' Close csv file and ADO connection
cn.close
objCSV.Close

wscript.echo "Finished"