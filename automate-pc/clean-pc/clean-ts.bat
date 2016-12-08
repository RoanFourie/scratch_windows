REM Deleting Archestra Files
echo Deleting Archestra Files
if exist "c:\Users\wwService.SGLENG\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\wwService.SGLENG\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\wwService.KDCE00SCTSE01GL\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\wwService.KDCE00SCTSE01GL\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\wwService\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\wwService\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\Wondercs\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\Wondercs\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\administrator.SGLENG\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\administrator.SGLENG\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\Chris\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\Chris\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\Jansen\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\Jansen\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\jason\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\jason\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\Wesley\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\Wesley\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\Roan\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\Roan\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\Fanie\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\Fanie\AppData\Roaming\ARCHESTRA\*.*"
if exist "c:\Users\A0000099\AppData\Roaming\ARCHESTRA"del /f /q "c:\Users\A0000099\AppData\Roaming\ARCHESTRA\*.*"


REM Deleting Windows Temporary Files
echo Deleting Windows Temporary Files
rd %temp% /s /q
md %temp%

REM Deleting Cookies
Echo Deleting Cookies
Ping localhost -n 3 >null
Del /f /q "%userprofile%\Cookies\*.*"

REM Deleting Temporary Internet Files
Echo Deleting Temporary Internet Files
Ping localhost -n 3 >null
Del /f /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"

REM Running Disk Cleanup...
echo Running Disk Cleanup...
ping localhost -n 3 >nul
if exist "C:\WINDOWS\temp"del /f /q "C:WINDOWS\temp\*.*"
if exist "C:\WINDOWS\tmp" del /f /q "C:\WINDOWS\tmp\*.*"
if exist "C:\tmp" del /f /q "C:\tmp\*.*"
if exist "C:\temp" del /f /q "C:\temp\*.*"
if exist "%temp%" del /f /q "%temp%\*.*"
if exist "%tmp%" del /f /q "%tmp%\*.*"
if not exist "C:\WINDOWS\Users\*.*" goto skip
if exist "C:\WINDOWS\Users\*.zip" del "C:\WINDOWS\Users\*.zip" /f /q
if exist "C:\WINDOWS\Users\*.exe" del "C:\WINDOWS\Users\*.exe" /f /q
if exist "C:\WINDOWS\Users\*.gif" del "C:\WINDOWS\Users\*.gif" /f /q
if exist "C:\WINDOWS\Users\*.jpg" del "C:\WINDOWS\Users\*.jpg" /f /q
if exist "C:\WINDOWS\Users\*.png" del "C:\WINDOWS\Users\*.png" /f /q
if exist "C:\WINDOWS\Users\*.bmp" del "C:\WINDOWS\Users\*.bmp" /f /q
if exist "C:\WINDOWS\Users\*.avi" del "C:\WINDOWS\Users\*.avi" /f /q
if exist "C:\WINDOWS\Users\*.mpg" del "C:\WINDOWS\Users\*.mpg" /f /q
if exist "C:\WINDOWS\Users\*.mpeg" del "C:\WINDOWS\Users\*.mpeg" /f /q
if exist "C:\WINDOWS\Users\*.ra" del "C:\WINDOWS\Users\*.ra" /f /q
if exist "C:\WINDOWS\Users\*.ram" del "C:\WINDOWS\Users\*.ram"/f /q
if exist "C:\WINDOWS\Users\*.mp3" del "C:\WINDOWS\Users\*.mp3" /f /q
if exist "C:\WINDOWS\Users\*.mov" del "C:\WINDOWS\Users\*.mov" /f /q
if exist "C:\WINDOWS\Users\*.qt" del "C:\WINDOWS\Users\*.qt" /f /q
if exist "C:\WINDOWS\Users\*.asf" del "C:\WINDOWS\Users\*.asf" /f /q
:skip
if not exist C:\WINDOWS\Users\Users\*.* goto skippy /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.zip del C:\WINDOWS\Users\Users\*.zip /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.exe del C:\WINDOWS\Users\Users\*.exe /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.gif del C:\WINDOWS\Users\Users\*.gif /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.jpg del C:\WINDOWS\Users\Users\*.jpg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.png del C:\WINDOWS\Users\Users\*.png /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.bmp del C:\WINDOWS\Users\Users\*.bmp /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.avi del C:\WINDOWS\Users\Users\*.avi /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mpg del C:\WINDOWS\Users\Users\*.mpg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mpeg del C:\WINDOWS\Users\Users\*.mpeg /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.ra del C:\WINDOWS\Users\Users\*.ra /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.ram del C:\WINDOWS\Users\Users\*.ram /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mp3 del C:\WINDOWS\Users\Users\*.mp3 /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.asf del C:\WINDOWS\Users\Users\*.asf /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.qt del C:\WINDOWS\Users\Users\*.qt /f /q
if exist C:\WINDOWS\Users\AppData\Temp\*.mov del C:\WINDOWS\Users\Users\*.mov /f /q
:skippy
if exist "C:\WINDOWS\ff*.tmp" del C:\WINDOWS\ff*.tmp /f /q
if exist C:\WINDOWS\ShellIconCache del /f /q "C:\WINDOWS\ShellI~1\*.*"

REM Defragmenting hard disks...
REM echo Defragmenting hard disks...
REM ping localhost -n 3 >nul
REM defrag -c -v
