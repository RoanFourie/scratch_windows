$smtpmail = [System.Net.Mail.SMTPClient]("sibanyegold.co.za")
$smtpmail.Send("roan.fourie@sibanyegold.co.za", "roan.fourie@sibanyegold.co.za", "Test Message", "Message via local smtp")