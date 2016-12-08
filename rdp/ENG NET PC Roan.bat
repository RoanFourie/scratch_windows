@echo off

cmdkey /generic:TERMSRV/172.17.96.20 /user:172.17.96.20\z1335971 /pass:Archestra1

start C:\Windows\System32\mstsc.exe /v:172.17.96.20 /f

exit