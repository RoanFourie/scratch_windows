On Error Resume Next
Dim oFSO, sCList, sComputer, sWinDir, colOperatingSystems, oOperatingSystem
Dim oWMIService, Error, sWinDirRaw, fso, drv, str
Const ForReading = 1
Const OverwriteExisting = True
'Get computers --------------------------------------------
Set oFSO = CreateObject("Scripting.FileSystemObject")
Set sCList = oFSO.OpenTextFile("c:\updates\computers.txt")
Do Until sCList.AtEndOfStream
sComputer = sCList.ReadLine
'Get WinDir name ------------------------------------------------------------
Set oWMIService = GetObject("winmgmts:\\" & sComputer)
Set colOperatingSystems = oWMIService.InstancesOf("Win32_OperatingSystem")
For Each oOperatingSystem In colOperatingSystems
sWinDirRaw = oOperatingSystem.WindowsDirectory
sWinDir = StripDriveInfo(sWinDirRaw)
Next
'If hosts exists, rename to hosts_old -----------------------------------------
If oFSO.FileExists("\\" & sComputer & "\c$\" & sWinDir & "\system32\drivers\etc\hosts") Then 
oFSO.CopyFile "\\" & sComputer & _
"\c$\" & sWinDir & "\system32\drivers\etc\hosts", "\\" & sComputer & _
"\c$\" & sWinDir & "\system32\drivers\etc\hosts_old", OverwriteExisting
End If
'Copy Hosts file ---------------------------------------------------------------
oFSO.CopyFile "C:\updates\Hosts_Master\hosts", "\\" & sComputer &_
"\C$\" & sWinDir & "\system32\drivers\etc\hosts", OverwriteExisting
If Error <> 0 Then
WScript.Echo "Error copying file to " & sComputer
Else
WScript.Echo "Finished script On " & sComputer
End If
Loop
sCList.Close
WScript.Echo "Finished Host Update on all computers"
MsgBox ("Exit?")


Function StripDriveInfo(path)
'Set fso = CreateObject("Scripting.FileSystemObject")
drv = oFSO.GetDriveName(path)
If Len(drv) >0 Then
str = Mid(path, Len(drv) + 2)
Else
str = path
End If
StripDriveInfo = str
End Function
