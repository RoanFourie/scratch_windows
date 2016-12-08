Set WshNetwork = WScript.CreateObject("WScript.Network")
'WScript.Echo "Domain = " & WshNetwork.UserDomain
'WScript.Echo "Computer Name = " & WshNetwork.ComputerName
'WScript.Echo "User Name = " & WshNetwork.UserName
MsgBox "Computer Name = " & WshNetwork.ComputerName & vbCrLf & "Domain Name = " & WshNetwork.UserDomain & vbCrLf & "User Name = " & WshNetwork.UserName, vbInformation, "PC Info - Roan"
