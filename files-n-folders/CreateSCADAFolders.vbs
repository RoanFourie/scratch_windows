'~~ Author: Roan Fourie
'~~ Date: 2016-02-24
'~~ Script to create the SCADA folders.
option Explicit

Dim dtYear, dtMonth, dtDay, dtDate
Dim fso1, dummy
Dim i, j

'~~> Create the year string to be used
dtYear = Year(Now)

'~~> Check if Data folders exists, if not, create it
'Each folder must be checked and created one level at a time because an entire path cannot be created at once.
Set fso1 = CreateObject("Scripting.FileSystemObject")
If (fso1.FolderExists("c:\DATA")) Then
    dummy = "Nothing"
Else
    dummy = fso1.CreateFolder("c:\DATA")
End If
If (fso1.FolderExists("c:\DATA\"& dtYear)) Then
    dummy = "Nothing"
Else
    dummy = fso1.CreateFolder("c:\DATA\"& dtYear)
End If

'~~> Create the month folders
i = 1
For i = 1 To 12 Step 1
    If (fso1.FolderExists("c:\DATA\"& dtYear & "\" & CStr(i))) Then
        dummy = "Nothing"
    Else
        dummy = fso1.CreateFolder("c:\DATA\"& dtYear & "\" & CStr(i))
    End If
Next

'~~> Check if SCADA folders exists, if not, create it
'Each folder must be checked and created one level at a time because an entire path cannot be created at once.
Set fso1 = CreateObject("Scripting.FileSystemObject")
If (fso1.FolderExists("c:\SCADA")) Then
    dummy = "Nothing"
Else
    dummy = fso1.CreateFolder("c:\SCADA")
End If
If (fso1.FolderExists("c:\SCADA\scripts")) Then
    dummy = "Nothing"
Else
    dummy = fso1.CreateFolder("c:\SCADA\scripts")
End If
If (fso1.FolderExists("c:\SCADA\logs")) Then
    dummy = "Nothing"
Else
    dummy = fso1.CreateFolder("c:\SCADA\logs")
End If