@echo off

cmdkey /generic:TERMSRV/172.17.96.20 /user:172.17.96.20\Administrator /pass:ITAdm!n4GFL
start C:\Windows\System32\mstsc.exe /v:172.17.96.20 /f

exit