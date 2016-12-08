$smtp = New-Object Net.Mail.SmtpClient("ho-ex2010-caht1.exchangeserverpro.net")
$smtp.Send("reports@exchangeserverpro.net","administrator@exchangeserverpro.net","Test Email","This is a test")