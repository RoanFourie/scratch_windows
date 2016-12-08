for /l %%G in (1601,1,6903) do schtasks /delete /TN "At%%G" /f
pause