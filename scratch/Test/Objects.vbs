

Set objRootDSE = GetObject("LDAP://rootDSE")
Set objUsers = GetObject("LDAP://CN=Users," & objRootDSE.Get("defaultNamingContext"))


'Get local computer name
'Set objShell = CreateObject("Wscript.Shell")
'Set objEnv = objShell.Environment("Process")
'strComputer = objEnv("COMPUTERNAME")

strComputer = GetComputerName()
wscript.echo strComputer


Set Group = GetObject("WinNT://" & strComputer & "/Administrators,group")

Function GetComputerName()
	'Get local computer name and return it as a string
	Dim strComputer
	
	Set objShell = CreateObject("Wscript.Shell")
	Set objEnv = objShell.Environment("Process")
	strComputer = objEnv("COMPUTERNAME")
	' wscript.echo strComputer
	GetComputerName = strComputer
End Function

