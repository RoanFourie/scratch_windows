Set WshShell = WScript.CreateObject("WScript.Shell")

' Start Notepad.exe
'WshShell.Run "%windir%\notepad.exe"

' Select, or bring Focus to a window named `Notepad`
WshShell.AppActivate "SCADA 8 SHAFT"

' Wait for 4 seconds
WScript.Sleep 4000

' Close the program by simulating ALT+F4
WshShell.SendKeys "%{F4}"

' Wait for 4 seconds
WScript.Sleep 6000

'~~> Open the Program again
Dim objShell
Set objShell = WScript.CreateObject( "WScript.Shell" )
objShell.Run("""c:\Program Files (x86)\Wonderware\Intouch\view.exe""")
Set objShell = Nothing