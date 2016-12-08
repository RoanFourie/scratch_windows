' computer name or ip address
sNode = "gfsa05867-pc"

' suppress errors
On Error Resume Next

' group name to remove user from
Set oGroupAdm = GetObject("WinNT://" & sNode & "/Administrators")

' loop through all members of the Administrators group
For Each oAdmGrpUser In oGroupAdm.Members

' get the name and make it lowercase
sAdmGrpUser = LCase(oAdmGrpUser.Name)

' Leave administrator and Domain Admins alone
' use lowercase letters in the names in the If statement!
If (sAdmGrpUser <> "administrator") And (sAdmGrpUser <> "SIBANYEGOLD\z1335971") And (sAdmGrpUser <> "z1335971") And (sAdmGrpUser <> "roan")Then
'msgbox oAdmGrpUser.Name
' remove users from Administrators group
oGroupAdm.Remove oAdmGrpUser.ADsPath
End if
Next
'msgbox "Users deleted. Completed the action"