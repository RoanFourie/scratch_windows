
Set objMsg        = CreateObject("CDO.Message")
    objMsg.Subject  = "CDO TEST MESSAGE" & vbTab & Now()
    objMsg.Sender   = "roan.fourie@sibanyegold.co.za" 
    objMsg.To          = "roan.fourie@sibanyegold.co.za"
    objMsg.From      = "roan.fourie@sibanyegold.co.za"
    objMsg.TextBody = "CDO TEST MESSAGE" & vbTab & Now()
    objMsg.AddAttachment "C:\socks.py" 'NOTE: DO NOT USE AN "=" SIGN AFTER "AddAttachment"
    objMsg.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
    objMsg.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "https://wmail.sibanyegold.co.za/owa/"
    objMsg.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
    objMsg.Configuration.Fields.Update
    objMsg.Send

Wscript.Echo "DONE"
Wscript.Quit