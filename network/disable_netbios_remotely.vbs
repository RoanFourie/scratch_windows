'Created by Luca Bazzuka
'for me stesso

On Error Resume Next
intArgIter = 0

If WScript.Arguments.Count = 0 Then
	WScript.Echo "NETConfig [\\Computer][Show|SetON|SetOFF]"
Else
	strComputerMAIN = "Non Inizializzata"
	Do While intArgIter <= WScript.Arguments.Count - 1
		strUserGivenArg = WScript.Arguments.Item(intArgIter)
		If LCase(Left(strUserGivenArg,2))="\\" Then
			strComputerMAIN = Mid(strUserGivenArg,3)
		End If
		intArgIter = intArgIter + 1
	Loop
	If strComputerMAIN = "Non Inizializzata" Then
		strComputerMAIN = "."
	End If
	intArgIter = 0
	Do While intArgIter <= WScript.Arguments.Count - 1
		strUserGivenArg = WScript.Arguments.Item(intArgIter)
		Select Case LCase(strUserGivenArg)
			Case LCase("SHOW")
				CALL SUBnetshow (strComputerMAIN)
			Case LCase("SETON")
				CALL SUBnetset (strComputerMAIN,0)
			Case LCase("SETOFF")
				CALL SUBnetset (strComputerMAIN,2)
		End Select
	intArgIter = intArgIter + 1
	Loop
End If
WSCript.Quit

Sub SUBnetshow (strComputer)

Set objWMIService = GetObject("winmgmts:" _
 & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colNicConfigs = objWMIService.ExecQuery _
 ("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")

For Each objNicConfig In colNicConfigs
  strDNSHostName = objNicConfig.DNSHostName
  intNetBIOS = objNicConfig.TcpipNetbiosOptions
  Select Case intNetBIOS
    Case 0 strNetBIOS = "Use NetBIOS setting from the DHCP server."
    Case 1 strNetBIOS = "Enable NetBIOS over TCP/IP."
    Case 2 strNetBIOS = "Disable NetBIOS over TCP/IP."
    Case Else strNetBIOS = "Unable to determine setting for NetBIOS " & _
     "Over TCP/IP."
  End Select
  strWINSSettings = strWINSSettings & VbCrLf & VbCrLf & _
   "  Network Adapter " & objNicConfig.Index & VbCrLf & _
   "    " & objNicConfig.Description & VbCrLf & VbCrLf & _
   "    NetBIOS: " & strNetBIOS & VbCrLf & _
   "    WINS Primary Server:             " & _
   objNicConfig.WINSPrimaryServer & VbCrLf & _
   "    WINS Secondary Server:           " & _
   objNicConfig.WINSSecondaryServer & VbCrLf & _
   "    WINS Scope ID:                   " & _
   objNicConfig.WINSScopeID & VbCrLf & _
   "    WINS Enable LMHosts Lookup:      " & _
   objNicConfig.WINSEnableLMHostsLookup & VbCrLf & _
   "    WINS Host Lookup File:           " & _
   objNicConfig.WINSHostLookupFile & VbCrLf & _
   "    DNS Enabled For WINS Resolution: " & _
   objNicConfig.DNSEnabledForWINSResolution
Next

WScript.Echo VbCrLf & "WINS Settings" & VbCrLf & VbCrLf & _
 "Host Name: " & strDNSHostName & strWINSSettings

End SUB

Sub SUBnetset (strComputer,strOpt)

Const ENABLE_NETBIOS_VIA_DHCP = 0
Const ENABLE_NETBIOS = 1
Const DISABLE_NETBIOS = 2

Set objWMIService = GetObject("winmgmts:" _
 & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colNicConfigs = objWMIService.ExecQuery _
 ("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")

WScript.Echo VbCrLf & "Host Name: " & strComputer
For Each objNicConfig in colNicConfigs
  WScript.Echo VbCrLf & "  Network Adapter " & objNicConfig.Index & _
   "    " & objNicConfig.Description & VbCrLf & _
  "    Attempting to set NetBIOS over TCP/IP."
  intNetBIOS = objNicConfig.SetTCPIPNetBIOS(strOpt)
  If intNetBIOS = 0 Then
    WScript.Echo "    Successfully set NetBIOS over TCP/IP"
  ElseIf intNetBIOS = 1 Then
    WScript.Echo "    Successfully set NetBIOS over TCP/IP" & _
     VbCrLf & "    Must reboot."
  Else
    WScript.Echo "    Unable to set NetBIOS."
  End If
Next

WScript.Echo VbCrLf & String(80, "-")

Set colNicConfigs = objWMIService.ExecQuery _
 ("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")

For Each objNicConfig In colNicConfigs
  WScript.Echo VbCrLf & _
   "  Network Adapter " & objNicConfig.Index & VbCrLf & _
   "    " & objNicConfig.Description
  intNetBIOS = objNicConfig.TcpipNetbiosOptions
  Select Case intNetBIOS
    Case 0 strNetBIOS = "Use NetBIOS setting from the DHCP server"
    Case 1 strNetBIOS = "Enable NetBIOS over TCP/IP"
    Case 2 strNetBIOS = "Disable NetBIOS over TCP/IP"
  End Select
  WScript.Echo "    NetBIOS Over TCP/IP: " & strNetBIOS
Next

End Sub