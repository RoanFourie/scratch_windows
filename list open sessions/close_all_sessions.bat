@echo off
ECHO \----------------------------------------\
ECHO \ Mapped sessions from computer outwards \
ECHO \----------------------------------------\
net use
ECHO \----------------------------------------\
ECHO \      Active sessions from outside      \
ECHO \----------------------------------------\
net session
ECHO \----------------------------------------\
ECHO \       Close all active sessions        \
ECHO \----------------------------------------\
net session /delete 
pause