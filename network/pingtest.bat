::PIng ISP Every 1 Seconds and write date , time and result to Text File

@ECHO OFF

:LOOPSTART

date /T >>"Pingtest%DATE%.log"

time /T >>Pingtest.log

ping 172.17.96.3 -n 1 >>PingTest.log

sleep -m 1000

GOTO LOOPSTART