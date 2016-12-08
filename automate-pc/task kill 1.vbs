'~~ Roan Fourie
'~~ 2016-02-02
'~~ Program to restart a program

'~~> Get the windows management object on the local computer
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
   & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
   
'~~> Select the program to be processed
Set colProcessList = objWMIService.ExecQuery _
   ("Select * from Win32_Process Where Name = 'view.exe'")

'~~> Close the selected program/s
For Each objProcess in colProcessList
   objProcess.Terminate()
Next

'~~> Wait a couple seconds
WScript.Sleep 6000 '6 seconds

'~~> Open the Program again
Dim objShell
Set objShell = WScript.CreateObject( "WScript.Shell" )
objShell.Run("""c:\Program Files (x86)\Wonderware\Intouch\view.exe""")
Set objShell = Nothing