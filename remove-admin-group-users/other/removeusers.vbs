Dim strLocalAdminGroup   
Dim strComputer   
Dim remadmins   

Set WshShell = Wscript.CreateObject("Wscript.Shell")   
Set WshSysEnv = WshShell.Environment("SYSTEM")   
Set WshUserEnv = WshShell.Environment("User")   
Set WshProEnv = WshShell.Environment("Process")   

strComputer = WshProEnv("gfsa05867-pc")   
remadmins = array("Everyone","SDomain Admins","Domain Users","SG-SGL-AD-Full","SG-SGL-CLSAdmin","SG-SGL-MSRA",,"SG-SGL-PCSupport","SG-SGL-SQLadmin","svc-ldc-sccmladmin")   
strLocalAdminGroup = "Administrators"   

For i = lbound(remAdmins) to ubound(remAdmins)   
Set grp = GetObject("WinNT://" & strComputer & "/" & strLocalAdminGroup)   
member = "WinNT://" & remAdmins(i)   
if grp.Ismember(member) = True then   
grp.Remove(member)   
end if   
next