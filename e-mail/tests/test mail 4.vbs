Sub SendMessage(DisplayMsg As Boolean, Optional AttachmentPath)
    Dim objOutlook As Outlook.Application
    Dim objOutlookMsg As Outlook.MailItem
    Dim objOutlookRecip As Outlook.Recipient
    Dim objOutlookAttach As Outlook.Attachment

    Set objOutlook = CreateObject("Outlook.Application")
    Set objOutlookMsg  = objOutlook.CreateItem(olMailItem)

    With objOutlookMsg
        Set objOutlookRecip = .Recipients.Add("Roan Fourie")
        objOutlookRecip.Type = olTo
        ' Set the Subject, Body, and Importance of the message.
        .Subject = "This is an Automation test with Microsoft Outlook"
        .Body = "This is the body of the message." &vbCrLf & vbCrLf
        .Importance = olImportanceHigh  'High importance

        If Not IsMissing(AttachmentPath) Then
            Set objOutlookAttach = .Attachments.Add("c:\setup.py")
        End If

        For Each ObjOutlookRecip In .Recipients
            objOutlookRecip.Resolve
        Next

        .Save
        .Send
    End With
    Set objOutlook = Nothing
end sub