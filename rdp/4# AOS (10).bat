@echo off

cmdkey /generic:TERMSRV/172.17.32.10 /user:gflsadfteng\wwService /pass:wwService

start C:\Windows\System32\mstsc.exe /v:172.17.32.10 /f

exit