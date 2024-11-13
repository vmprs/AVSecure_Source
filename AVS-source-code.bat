@echo off
if not exist avs.dat goto runsetup
goto load1

:runsetup
cls
color 1f
set /p nan=Press any key to start setup...
if not exist setup.bat start setup.exe
if not exist setup.exe start setup.bat
exit

:load1
set /a loadnum=0
goto load2

:load2
color 05
title AVS (Antivirus Secure) Antivirus - Loading
cls
echo.
echo Loading... %loadnum% completed...
ping localhost -n 2 >nul

set/a loadnum=%loadnum% +1
if %loadnum%==100 goto mainui

goto load2

:mainui
title AVS (Antivirus Secure) Antivirus
if exist activationkey.dat set codeak=Product activated
if not exist activationkey.dat set codeak=Not activated.
cls
color 1e
echo ::::::::::::::::::::::::::::::::::::::::::::
echo ::            AVS Antivirus               ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo ::     1) Scan for viruses                ::
echo ::     2) Scan for adwares                :: 
echo ::     3) Activate antivirus              ::
echo ::     4) Exit                            ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo Product status: %codeak%
echo.
set /p choice=Select a choice:
if %choice%==1 (
goto scanA
) 
if %choice%==2 (
goto scanad
)
if %choice%==3 (
goto activea
)
if %choice%==4 (
goto exita
) else (
goto mainui
)

:exita
cls
exit

:activea
cls
echo Enter your activation key here! Type E to exit.
echo Note: Your key can be found behind the box
echo.
set /p activationkey=
if %activationkey% == U7WXINMLJXt4rLzx8wbuHPq8DHXInD9K goto activated
if %activationkey% == E goto mainui
goto wrongkey

:wrongkey
cls
echo Wrong key entered or you just pressed enter. Please try again
pause
goto activea

:activated
echo U7WXINMLJXt4rLzx8wbuHPq8DHXInD9K > activationkey.dat
cls
echo Your antivirus has been activated! Thank you, you're now fully protected.
pause
goto mainui

:scanA
title AVS Scanner
set /a loadnum=0
:scanB
cls
echo.
echo Scanning for viruses... %loadnum% completed...
ping localhost -n 2 >nul

set/a loadnum=%loadnum% +1
if %loadnum%==100 goto scanC
goto scanB

:pleaseactivate
cls
echo Please activate to clean / quarantine the viruses!
echo.
pause>nul
goto ResultsA

:scanC
cls
echo.
echo Scanning for malwares... %loadnum% completed...
ping localhost -n 2 >nul

set/a loadnum=%loadnum% +1
if %loadnum%==100 goto scanComplete

:scanComplete
cls
color 0a
echo ::::::::::::::::::::::::::::::::::::::::::::
echo ::            AVS Scanner                 ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo.             
echo Scan complete! Please wait while we process the results
ping localhost -n 10 >nul
:ResultsA
set removalnum=0
cls
echo ::::::::::::::::::::::::::::::::::::::::::::
echo ::            AVS Scanner                 ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo. 
echo Results loaded!
echo ::::::::::::::::::::::::::::::::::::::::::::
echo :: Trojan.W32.Death  ::  Dangerous        ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo :: Web-Hijacker.A    ::  Removable        ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo :: Email-Worm.Halt   ::  Not harmful      ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo :: IRC-Worm.W32.Love :: Slightly dangerous::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo.
echo [1] Remove viruses [2] Quarantine [3] Ignore
echo.
set /p choice2=Select a choice:
if %choice2%==1 goto removalA
if %choice2%==2 goto quarantineA
if %choice2%==3 goto mainui
goto ResultsA

:removalA
if not exist activationkey.dat goto pleaseactivate
cls
echo.
echo Removing malwares... %removalnum% completed...
ping localhost -n 2 >nul

set/a loadnum=%removalnum% +1
if %removalnum%==100 goto removalComplete
goto removalA

:removalComplete
cls
echo Removal has successfully removed the viruses.
pause
goto mainui

:quarantineA
if not exist activationkey.dat goto pleaseactivate
cls
echo Quarantined the viruses successfully!
echo.
pause
goto mainui

:scanad
cls
echo work in progress
pause
goto mainui
