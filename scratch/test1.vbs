' ****************************************************************************
' List all users and some of their properties in a Windows 2000 AD domain or 
' Windows NT4 domain. If domain is a computer, all users of the local SAM 
' database are displayed.
' ****************************************************************************
' Goto http://www.activxperts.com/activmonitor and click on ADSI Samples
' for more samples
' ****************************************************************************

Sub ListUsers( strDomain )
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
		WScript.Echo ""
	
	Next
End Sub


' ****************************************************************************
' Main
' ****************************************************************************
Dim strDomain
Do
   strDomain = inputbox( "Please enter a domainname", "Input" )
Loop until strDomain <> ""

ListUsers( strDomain )


WScript.Echo( vbCrlf & "For more samples, goto http://www.activxperts.com/activmonitor and click" )
WScript.Echo( "on ADSI samples" )