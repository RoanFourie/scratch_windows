@echo off

cmdkey /generic:TERMSRV/172.17.0.7 /user:gflsadfteng\wwService /pass:wwService

start C:\Windows\System32\mstsc.exe /v:172.17.0.7 /f

exit