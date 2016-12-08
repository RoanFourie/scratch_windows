'~~ Roan Fourie
'~~ 2016-02-02
'~~ Program to restart a program

'~~> Get the windows management object on the local computer
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   
'~~> Select the program to be processed
'("Select * from Win32_Process Where Name = 'Notepad.exe'")  ' ‘c_lc.exe'” 'The _ means any character almost like when using * in a search
Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name like 'TeamViewer'")

'~~> Close the selected program/s
For Each objProcess in colProcessList
   objProcess.Terminate()
Next

'~~> Wait a couple seconds
WScript.Sleep 6000 '6 seconds

'~~> Open the Program again
Dim objShell
Set objShell = WScript.CreateObject( "WScript.Shell" )
objShell.Run """C:\Program Files (x86)\TeamViewer\TeamViewer.exe""", 2  ' 6 or 2 = minimized, 3 or 1 = maximized and activate
Set objShell = Nothing