
' ****************************************************************************
' Main
' ****************************************************************************
DIM strComputer

strComputer = GetComputerName()

ListUsers( strDomain )


WScript.Echo( vbCrlf & "For more samples, goto http://www.activxperts.com/activmonitor and click" )
WScript.Echo( "on ADSI samples" )


' ****************************************************************************
' FUNCTIONS
' ****************************************************************************

Public Function GetComputerName()
	'Get local computer name and return it as a string
	Dim strComputer
	
	Set objShell = CreateObject("Wscript.Shell")
	Set objEnv = objShell.Environment("Process")
	strComputer = objEnv("COMPUTERNAME")
	' wscript.echo strComputer
	GetComputerName = strComputer
End Function

Sub ListUsers( strComputer )
	'Write users into a XML file
	Dim strName, strFullName, strDescription, strAccDis, strProfile, strEnvironment, strGroup1, strGroup2
	
	Set objComputer = GetObject("WinNT://" & strDomain )
	objComputer.Filter = Array( "User" )
	For Each objUser In objComputer
		WScript.Echo "Name: " & objUser.Name
		WScript.Echo "Fullname: " & objUser.Fullname
		WScript.Echo "Description: " & objUser.Description
		WScript.Echo "AccountDisabled: " & objUser.AccountDisabled
		WScript.Echo "IsAccountLocked: " & objUser.IsAccountLocked
		WScript.Echo "Profile: " & objUser.Profile
		WScript.Echo "LoginScript: " & objUser.LoginScript
		WScript.Echo "HomeDirectory: " & objUser.HomeDirectory
	
	Next
End Sub