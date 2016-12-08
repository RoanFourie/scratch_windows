
Const ForReading = 1
Const ForWriting = 2

Dim fileBatch
Dim objUsers
Dim outFile
Dim objRootDSE
Dim objFSO
Dim curDir
Dim fldr
Dim f


fileBatch = "C:\test\test.txt"
fldr = "C:\test\"


'Create the folder and create the batch file (this will still be an empty batch file at this time
Set objFSO = CreateObject("Scripting.FileSystemObject")
'Open write stream
If (objFSO.FolderExists(fldr)) Then 'checks if the folder exists
      Set outFile = objFSO.CreateTextFile(fileBatch, True) 'Yes, then do not create the folder, only create the batch file
	  outFile.close
Else
	WScript.Echo fldr
      Set f = objFSO.CreateFolder(fldr) 'No then create the folder and create the text file
	  'f.close
	  Set outFile = objFSO.CreateTextFile(fileBatch, True)
	  outFile.close
End If

Set objRootDSE = GetObject("LDAP://rootDSE")

Set objNetwork = CreateObject("Wscript.Network")
strComputer = objNetwork.ComputerName


Set objUsers = GetObject("LDAP://CN=Users," & objRootDSE.Get("defaultNamingContext"))
Set outFile = objFSO.OpenTextFile(fileBatch, ForWriting, True, -2)
For Each objUsers in objUsers
	outFile.WriteLine objUsers.sAMAccountName & "," & objUsers.displayName & "," & objUsers.destinguishedName  & "," & objUsers.title
Next



'***************************************************
'Set objUserClass = GetObject("LDAP://schema/user")
'Set objSchemaClass = GetObject(objUserClass.Parent)
'Set outFile = objFSO.OpenTextFile(fileBatch, ForWriting, True, -2) 
'i = 0
'outFile.WriteLine "Mandatory attributes:"
'For Each strAttribute in objUserClass.MandatoryProperties
'    i= i + 1
'    outFile.WriteLine strAttribute & ","
'Next
' 
'outFile.WriteLine VbCrLf & "Optional attributes:"
'For Each strAttribute in objUserClass.OptionalProperties
'    i=i + 1
'    outFile.WriteLine strAttribute & ","
'    
'Next
'*****************************************************************

