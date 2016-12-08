$param = @{
    SmtpServer = 'smtp.gmail.com'
    Port = 587
    UseSsl = $true
    Credential = 'roanfourie@gmail.com'
    From = 'roanfourie@gmail.com'
    To = 'roanfourie@gmail.com'
    Subject = 'test 123'
    Body = "Test 123. this is a body"
    Attachments = 'c:\test.txt'
}

Send-MailMessage @param