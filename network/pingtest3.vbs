'hostIp      = wscript.arguments(0)
'logfilename = wscript.arguments(1)
hostIP      = "klfms18-f"
logfilename = "c:\pingtestlog" & Date &"-"& Hour(Time()) &".log"
Set fso     = CreateObject("Scripting.FileSystemObject")
Set Shell   = CreateObject("Wscript.Shell")
Set logfile = fso.OpenTextFile(logfilename, 8, True)
shellstring = "%comspec% /c ping -t " & hostIP
Set oExec   = Shell.Exec(shellstring)
wscript.echo "Ping Error log With Timestamp - Ctrl + C to halt"
Do While oExec.StdOut.AtEndOfStream <> True
		pingline = Date & " " & Time & " " & oExec.StdOut.ReadLine
		If InStr(pingline, "TTL=") = 0 Then
			logfile.WriteLine(pingline)
		End If
Loop