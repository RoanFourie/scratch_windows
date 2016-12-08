' MultiGrp.vbs
' VBScript to create Groups
' AUTHOR: Guy Thomas 
' COMPANY: Computer Performance
' Version 3.5 - May 2006
' ----------------------------------------------------------' 
Option Explicit
Dim strOU, strGroup, strTextGroup, strUser, strFile
Dim strDNSDomain, objRootDSE, objFSO, objTextFile, intCounter
Dim objOU, objUser, objGroup

Const ForReading = 1
Const ADS_PROPERTY_APPEND = 3
intCounter = 0 

'  strUser ("CN=Pete ,") must exist in your OU.
'  Set the Name of the OU which holds the user and groups
'  NB introduce another variable if user and group are in different OUs
strUser = "CN=Pete ," 
strOU = "OU=Security Groups ,"
strFile = "\\grand\scripts\pete.txt"

'  Open the file For Reading your Group Names
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.OpenTextFile(strFile, ForReading) 

'  Here is the loop
Do
     strTextGroup = objTextFile.ReadLine
     strGroup = "CN=" & strTextGroup & " ," 

     '  Bind to Active Directory and get LDAP name
     Set objRootDSE = GetObject("LDAP://RootDSE")
     strDNSDomain = objRootDSE.Get("DefaultNamingContext") 

     '  Prepare the OU and the Group
     Set objOU =GetObject("LDAP://" & strOU & strDNSDomain) 
     Set objGroup = GetObject("LDAP://"& strGroup & strOU & strDNSDomain) 

     '  On Error Resume next
     '  Add user to Group with .PutEx (put extended)
     Set objGroup = GetObject ("LDAP://"& strGroup & strOU & strDNSDomain)
     objGroup.PutEx ADS_PROPERTY_APPEND, _
     "member", Array(strUser & strOU & strDNSDomain)
     objGroup.SetInfo

     intCounter = intCounter +1 
     WScript.Echo strUser & " has " & intCounter & " new groups"

Loop Until objTextFile.AtEndOfLine = true 
objTextFile.Close 

'  End of add Groups VBScript