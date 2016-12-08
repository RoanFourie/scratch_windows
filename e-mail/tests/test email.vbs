Set objMsg = CreateObject("CDO.Message")
objMsg.Subject = "test message subject"&vbTab&Now()
objMsg.Sender = "roan.fourie@sibanyegold.co.za"
objMsg.To = "roan.fourie@sibanyegold.co.za"
objMsg.From = "roanfourie@gmail.com"
objMsg.TextBody = "test 123"&vbTab&Now()
objMsg.AddAttachment "c:\temp.csv"
objMsg.Send
Wscript.Echo "Done"
Wscript.Quit