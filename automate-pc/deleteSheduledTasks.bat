REM this was used on 3# runtime to delete the 6903 tasks created by a virus

FOR /L %%G in (1,1,6903) do schtasks /DELETE /TN /F