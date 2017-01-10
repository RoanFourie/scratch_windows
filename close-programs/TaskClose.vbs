Set WshShell = CreateObject("WScript.Shell")
Const SINGLECLOSEAPPS = "iexplore.exe|firefox.exe"
Dim DEFAULTSAVELOCATION : DEFAULTSAVELOCATION = wshshell.SpecialFolders("Desktop")
Const AUTOCLOSEAPPS = "notepad.exe"

Const WshFinished = 1
Const WshFailed = 2
strCommand = "returnapplist.bat "
Set WshShellExec = WshShell.Exec(strCommand & WScript.Arguments(0))

WScript.sleep 2000

Select Case WshShellExec.Status
    Case WshFinished
    strOutput = LoadStringFromFile("result.txt")
    Case WshFailed
    strOutput = LoadStringFromFile("result.txt")
End Select


'SmartSendKeys(application_name_array, bypassclause, additionalcommands)
'========================
If InStr(SINGLECLOSEAPPS, WScript.arguments(0)) Then
    SmartSendKeys strOutput,"bypass","%{F4}"
ElseIf InStr(AUTOCLOSEAPPS, WScript.arguments(0)) Then
    SmartSendKeys strOutput,"","%{F4}|%s|{autoname}.txt|%s"
ElseIf InStr(WScript.arguments(0), "SCADA") Then
    SmartSendKeys strOutput,"","%{F4}" 'Activate Alt+4
Else
    SmartSendKeys strOutput,"bypass","%{F4}"
End If




'SmartSendKeys(application_name_array, bypassclause, additionalcommands)
'========================
Function SmartSendkeys(fArr, LoopCount, RollCommands) 
    Dim x 
    Dim splt : splt = Split(farr, vbCrLf)
    If loopcount = "bypass" Then 
        x = 0
    Else
        x = UBound(splt)
    End If
    a = 0
    For s=0 To x
        If Len(splt(s)) > 1 Then
            Set objShell = WScript.CreateObject("WScript.Shell")
            c = 1 : tabs = ""
            Success = False
            Do Until Success = True
                Success = objShell.AppActivate(Trim(splt(s)))
                If success <> True Then
                    If c = 1 Then 
                        tabs = "{TAB}"
                    Else
                        tabs = "{TAB " & c & "}"
                    End If
                    'wscript.echo "Activating: " & "%" & tabs
                    WshShell.SendKeys "%" & tabs
                    WScript.Sleep 5000
                    c = c + 1
                    If c = 100 Then 
                        WScript.echo "App not found"
                        Exit Function
                    End If
                End If
            Loop
            Dim cmds : cmds = Split(rollcommands, "|")

            For Each cm In cmds
                If InStr(cm, "{autoname}") Then
                    Dim file_ext : file_ext = Split(cm, ".") 
                    cm = DEFAULTSAVELOCATION & "autosave" & a & "." & file_ext(1)
                    a = a + 1
                End If
                WshShell.SendKeys cm
                WScript.sleep 500

            Next
        End If
    Next
End Function

Function LoadStringFromFile(filename)
    Const fsoForReading = 1
    Const fsoForWriting = 2
    Dim fso, f
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(filename, fsoForReading)
    Dim fulltext : fulltext = f.ReadAll
    LoadStringFromFile = fulltext
    f.Close
    fso.DeleteFile(filename)
End Function