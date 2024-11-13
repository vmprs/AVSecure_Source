@echo off
if exist setup.dat goto alr
md C:\temp-avs
copy avs.exe C:\temp-avs
goto start

:alr
cls
echo You already ran the setup...
pause>nul
exit

:start
cls
echo Welcome to AVS Setup
echo ====================================
set /p choice=Start the setup (y/n)
if %choice%==y goto setup
if %choice%==n goto start
goto errmsg

:setup
title AVS Setup
echo.
echo Writing files....
echo.
ping localhost -n 15 >nul
echo mainui.config, set=1 > mainui.dll
echo database=avsantivirus.com/databases > databases.dll
echo setup-complete=true > setup.dat
echo Load=true, LoadUI = true, LoadDatabases=true > avs.dat
start enablertp.exe
echo.
cls
echo Setup completed!
pause
exit

:errmsg
cls
echo Invalid parameters/input, please insert a valid input.
echo.
pause
goto start