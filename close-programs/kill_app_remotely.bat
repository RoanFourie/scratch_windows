REM Remotely stop the SCADA View Application
REM Invoke-Command -ComputerName HostNameHere -ScriptBlock {Stop-Process view}
taskkill /S 192.168.0.9 /U 192.168.0.9\UserNameHere /P PasswordHere /F /IM view
