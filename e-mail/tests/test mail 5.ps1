##############################################################################
$From = "roanfourie@gmail.com"
$To = "roan.fourie@sibanyegold.co.za"
##$Cc = "YourBoss@YourDomain.com"
$Attachment = "C:\setup.py"
$Subject = "Email Subject"
$Body = "Insert body text here"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) -Attachments $Attachment

##############################################################################