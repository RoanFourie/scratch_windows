'~~ Author: Roan Fourie
'~~ Date: 2016-02-24
'~~ Script to create the DATA folders used in our old DATA csv files.
option Explicit

Dim dtYear, dtMonth, dtDay, dtDate
Dim fso1, dummy

dtYear = Year(Now)
dtMonth = Month(Now)

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
If (fso1.FolderExists("c:\DATA\"& dtYear & "\" & dtMonth)) Then
    dummy = "Nothing"
Else
    dummy = fso1.CreateFolder("c:\DATA\"& dtYear & "\" & dtMonth)
End If