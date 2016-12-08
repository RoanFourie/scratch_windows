@echo off

:loop
ping -n 172.17.96.3 >nul || echo %date% %time% no reply from 172.17.96.3 >> pinglog.txt
choice /N /T 1 /D Y >nul
sleep -m 1000
goto loop