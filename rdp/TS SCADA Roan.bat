@echo off

cmdkey /generic:TERMSRV/172.17.96.3 /user:172.17.96.3\z1335971 /pass:Archestra1

start C:\Windows\System32\mstsc.exe /v:172.17.96.3 /f

exit