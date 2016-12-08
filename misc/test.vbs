Dim lDraftItem, myOutlook, myNameSpace, myFolders, myDraftsFolder

Set myOutlook = CreateObject("Outlook.Application")
Set myNameSpace = myOutlook.GetNamespace("MAPI")
myNameSpace.Logon "Outlook"
Set myFolders = myNameSpace.Folders

Set myDraftsFolder = myFolders("John Glick").Folders("Drafts")

For lDraftItem = myDraftsFolder.Items.Count To 1 Step -1
    If InStr(1,myDraftsFolder.Items.Item(lDraftItem).Subject,"Punch Pair Detail Report") > 0 Then
        myDraftsFolder.Items.Item(lDraftItem).Send
    End If
Next

Set myDraftsFolder = Nothing
Set myNameSpace = Nothing
Set myOutlook = Nothing