@echo off
cp65001
cls

:: Greet the user and check for administrator privileges
echo Windows Upgrader
echo.

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script must be run as an administrator. Exiting...
    exit /b
)

:: Ask the preferred upgrade version
echo Which version of Windows would you like to upgrade to?
echo.
echo [1] Home
echo [2] Pro
echo [3] Education
echo [4] Enterprise
echo.
set /P option=Enter your choice (1-4):

:: Ask user if they'd like Media support
echo.
set /P media=Do you want to have Media support? (Y/N):
echo.

:: Evaluate variables
if %option%==1 (
    if /i "%media%"=="Y" (
        set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
        set name=Windows Home
    ) else (
        set key=3KHY7-WNT83-DGQKR-F7HPR-844BM
        set name=Windows Home without Media
    )
) else if %option%==2 (
    if /i "%media%"=="Y" (
        set key=W269N-WFGWX-YVC9B-4J6C9-T83GX
        set name=Windows Pro
    ) else (
        set key=MH37W-N47XK-V7XM9-C7227-GCQG9
        set name=Windows Pro without Media
    )
) else if %option%==3 (
    if /i "%media%"=="Y" (
        set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
        set name=Windows Education
    ) else (
        set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
        set name=Windows Education without Media
    )
) else if %option%==4 (
    if /i "%media%"=="Y" (
        set key=NPPR9-FWDCX-D2C8J-H872K-2YT43
        set name=Windows Enterprise
    ) else (
        set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
        set name=Windows Enterprise without Media
    )
)

:: Warn and ask user for final confirmation
echo You have chosen %name%.
echo.
echo You cannot downgrade after upgrading Windows keys.
echo.
set /P upgrade=Are you sure you wish to upgrade to %name%? (Y/N):

if /i "%upgrade%"=="Y" (
    echo.
    echo Upgrading now...
    slmgr /upk
    slmgr /cpky
    slmgr /ckms
    sc config LicenseManager start= auto
    net start LicenseManage
    sc config wuauserv start= auto
    net start wuauser
    changepk.exe /productkey %key%
    echo You have registered %name%.
    echo Restart to apply these changes.
    exit
) else (
    echo.
    echo End-user stalemate; exiting.
    echo.
)
exit
