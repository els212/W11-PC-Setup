@echo off
:: Fichier crée et edité par el.s212 le 10/09/2026 et mit à jour le 10/09/2026

:apps
cls
echo 1. Chrome
echo 2. Brave
echo 3. Discord
echo 4. Spotify
echo 5. Epic Games Launcher
echo 6. ExitLag
echo 7. Valorant
echo 8. League of Legends
echo 9. Blitz
echo 10. NVIDIA FrameView
echo 11. OBS Studio
echo 12. MSI Afterburner
echo 13. Notepad++
echo 14. VSCode
echo 15. VLC Media Player
echo 16. Steam
echo 17. Lunar Client
echo 18. CurseForge
echo.
echo X. Quitter
echo.

set /p choix="Choose which app you want to install : "

if "%choix%"=="1" goto chrome
if "%choix%"=="2" goto brave
if "%choix%"=="3" goto discord
if "%choix%"=="4" goto spotify
if "%choix%"=="5" goto epic
if "%choix%"=="6" goto exitlag
if "%choix%"=="7" goto valorant
if "%choix%"=="8" goto lol
if "%choix%"=="9" goto blitz
if "%choix%"=="10" goto frameview
if "%choix%"=="11" goto obs
if "%choix%"=="12" goto afterburner
if "%choix%"=="13" goto npp
if "%choix%"=="14" goto vscode
if "%choix%"=="15" goto vlc
if "%choix%"=="16" goto steam
if "%choix%"=="17" goto lunar
if "%choix%"=="18" goto curseforge
if "%choix%"=="X" exit
if "%choix%"=="x" exit

cls
echo This choice is invalid, please try again.
pause
goto apps


:chrome
cls
echo Installing Chrome...
powershell "iwr 'https://dl.google.com/tag/s/appguid%%3D%%7B8A69D345-D564-463C-AFF1-A69D9E530F96%%7D%%26iid%%3D%%7B488E12A0-105F-70E4-144F-7739707F8937%%7D%%26lang%%3Dfr%%26browser%%3D4%%26usagestats%%3D0%%26appname%%3DGoogle%%2520Chrome%%26needsadmin%%3Dprefers%%26ap%%3D-arch_x64-statsdef_1%%26installdataindex%%3Dempty/update2/installers/ChromeSetup.exe' -OutFile '%temp%\Chrome.exe'"
start /wait "" "%temp%\Chrome.exe" /silent /install
setlocal enabledelayedexpansion
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HardwareAccelerationModeEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
for /f "tokens=*" %%K in ('reg query "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components"') do (
    for /f "usebackq tokens=2* delims= " %%A in (`reg query "%%K" /ve 2^>nul ^| findstr /I "google"`) do (
        reg delete "%%K" /f
    )
)
for /f "tokens=2 delims= " %%s in ('sc query state^= all ^| findstr /I "SERVICE_NAME.*google"') do (
    sc stop %%s
    sc delete %%s
)
for /f "usebackq tokens=1 delims=," %%A in (`schtasks /Query /FO CSV /NH ^| findstr /I "Google"`) do (
    set "schdtask=%%~A"
    schtasks /Delete /TN "!schdtask!" /f
)
endlocal
goto apps


:brave
cls
echo Installing Brave...
powershell "iwr 'https://referrals.brave.com/latest/BraveBrowserSetup-BRV010.exe' -OutFile '%temp%\Brave.exe'"
start /wait "" "%temp%\Brave.exe" /silent /install
setlocal enabledelayedexpansion
reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "HardwareAccelerationModeEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
for /f "tokens=*" %%K in ('reg query "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components"') do (
    for /f "usebackq tokens=2* delims= " %%A in (`reg query "%%K" /ve 2^>nul ^| findstr /I "brave"`) do (
        reg delete "%%K" /f
    )
)
for /f "tokens=2 delims= " %%s in ('sc query state^= all ^| findstr /I "SERVICE_NAME.*brave"') do (
    sc stop %%s
    sc delete %%s
)
for /f "usebackq tokens=1 delims=," %%A in (`schtasks /Query /FO CSV /NH ^| findstr /I "Brave"`) do (
    set "schdtask=%%~A"
    schtasks /Delete /TN "!schdtask!" /f
)
endlocal
goto apps


:discord
cls
echo Installing Discord...
setlocal
mkdir "%userprofile%\AppData\Roaming\discord" >nul 2>&1
set "config=%userprofile%\AppData\Roaming\discord\settings.json"

(
	echo {
	echo "START_MINIMIZED": false,
	echo  "MINIMIZE_TO_TRAY": false,
	echo  "enableHardwareAcceleration": false,
	echo  "IS_MAXIMIZED": false,
	echo  "IS_MINIMIZED": false,
	echo  "WINDOW_BOUNDS": {
	echo    "x": 235,
    echo    "y": 111,
    echo    "width": 1264,
    echo    "height": 791
	echo  },
	echo  "debugLogging": false,
	echo  "asyncVideoInputDeviceInit": true
	echo }
) > "%config%"
endlocal
powershell "iwr 'https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64' -OutFile '%temp%\Discord.exe'"
explorer "%temp%\Discord.exe"
goto apps


:spotify
cls
echo Installing Spotify...
powershell "iwr 'https://download.scdn.co/SpotifySetup.exe' -OutFile '%temp%\Spotify.exe'"
explorer "%temp%\Spotify.exe"
cls
echo Press any key after spotify is installed...
pause >nul >2&1
taskkill /f /im Spotify.exe >nul >2&1
setlocal
set "config=%userprofile%\AppData\Roaming\Spotify\prefs"

(
	echo app.autostart-configured=true
	echo app.autostart-mode="off"
	echo ui.hardware_acceleration=false
) > "%config%"
endlocal
goto apps


:epic
cls
echo Installing Epic Games Launcher...
powershell "iwr 'https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi' -OutFile '%temp%\Epic Games Launcher.msi'"
start /wait msiexec /i "%temp%\Epic Games Launcher.msi" /qn /norestart
cls
start "" "C:\Program Files\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe"
echo Press any key after launcher update is done...
pause >nul >2&1
taskkill /f /im EpicGamesLauncher.exe >nul >2&1
setlocal
set "config=%userprofile%\AppData\Local\EpicGamesLauncher\Saved\Config\WindowsEditor\GameUserSettings.ini"

(
	echo [Launcher]
	echo HasMigratedFabIsFabMarkers=True
	echo.
	echo [Portal.OSS]
	echo bShouldPrimeEms=False
	echo.
	echo [CertUpdate]
	echo Curl=True
	echo.
	echo [d57f2ed5da444788b8dd383a2772d964_General]
	echo DisableGameTabs=False
	echo MinimiseToSystemTray=False
	echo NotificationsEnabled_FreeGame=False
	echo NotificationsEnabled_Adverts=False
	echo NotificationsEnabled_Chat=False
	echo NotificationsEnabled_GameInvite=False
	echo.
	echo [NotificationsDismissed]
	echo ue:ed2b249a315e4493b084233d5167fea3:UE_4.27Chaos[d57f2ed5da444788b8dd383a2772d964][NewEngine]=True
	echo.
	echo [d57f2ed5da444788b8dd383a2772d964_AutoInstall]
	echo Checked=True
	echo.
	echo [d57f2ed5da444788b8dd383a2772d964_DismissedDialog]
	echo MinimiseToSystemTray=True
) > "%config%"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "EpicGamesLauncher" /f >nul >2&1
endlocal
goto apps


:exitlag
cls
echo Installing ExitLag...
powershell "iwr 'https://cdn.exitlag.com/SetupExitLag-5.22.1-x64.exe' -OutFile '%temp%\ExitLag.exe'"
start /wait "" "%temp%\ExitLag.exe" /verysilent
goto apps


:valorant
cls
echo Installing Valorant...
powershell "iwr 'https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe' -OutFile '%temp%\Valorant.exe'"
start /wait "" "%temp%\Valorant.exe" --skip-to-install
goto apps


:lol
cls
echo Installing League of Legends...
powershell "iwr 'https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.euw.exe' -OutFile '%temp%\League of Legends.exe'"
start /wait "" "%temp%\League of Legends.exe" --skip-to-install
goto apps


:blitz
cls
echo Installing Blitz...
start /wait "" /min cmd.exe /c winget install --id Blitz.Blitz --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apps


:frameview
cls
echo Installing NVIDIA FrameView...
start /wait "" /min cmd.exe /c winget install --id Nvidia.FrameView --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apps


:obs
cls
echo Installing OBS Studio...
start /wait "" /min cmd.exe /c winget install --id OBSProject.OBSStudio --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apps


:afterburner
cls
echo Installing MSI Afterburner...
start /wait "" /min cmd.exe /c winget install --id Guru3D.Afterburner --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto dmdrtss

:dmdrtss
cls
echo RTSS is installed by default with MSI Afterburner.
echo Do you want to keep it :
echo 1 : Oui
echo 2 : Non

set /p choix="Enter your choice : "

if "%choix%"=="1" goto apps
if "%choix%"=="2" goto nortss

cls
echo This choice is invalid, please try again : 
pause
goto dmdrtss


:nortss
cls
echo Uninstalling RTSS...
start /wait "" "C:\Program Files (x86)\RivaTuner Statistics Server\Uninstall.exe" /S
goto apps


:npp
cls
echo Installing Notepad++...
start /wait "" /min cmd.exe /c winget install --id "Notepad++.Notepad++" --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apps


:vscode
cls
echo Installing VSCode...
powershell "iwr 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64' -OutFile '%temp%\VSCode.exe'"
start /wait "" "%temp%\VSCode.exe" /VERYSILENT
goto apps


:vlc
cls
echo Installing VLC...
start /wait "" /min cmd.exe /c winget install --id VideoLAN.VLC --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apps

:steam
cls
echo Installing Steam...
powershell "iwr 'https://cdn.fastly.steamstatic.com/client/installer/SteamSetup.exe' -OutFile '%temp%\Steam.exe'"
start /wait "" "%temp%\Steam.exe" /S
goto apps


:lunar
cls
echo Installing Lunar Client...
start /wait "" /min cmd.exe /c winget install --id Moonsworth.LunarClient --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apps

:curseforge
cls
echo Installing CurseForge...
start /wait "" /min cmd.exe /c winget install --id Overwolf.CurseForge --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apps