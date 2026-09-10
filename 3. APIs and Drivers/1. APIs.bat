@echo off
:: Fichier crée et edité par el.s212 le 10/09/2026 et mit à jour le 10/09/2026

: apis
cls
echo 1. DirectX
echo 2. VisualC++
echo 3. .NET 8.0
echo 4. .NET 9.0
echo 5. .NET 10.0
echo.
echo X. Exit
echo.

set /p choix="Choose which API you want to install : "

if "%choix%"=="1" goto DX
if "%choix%"=="2" goto VC
if "%choix%"=="3" goto net8
if "%choix%"=="4" goto net9
if "%choix%"=="5" goto net10
if "%choix%"=="X" exit
if "%choix%"=="x" exit

cls
echo This choice is invalid, please try again. : 
pause
goto apis


: DX
cls
echo Installing DirectX...
powershell "iwr "https://download.microsoft.com/download/1/7/1/1718ccc4-6315-4d8e-9543-8e28a4e18c4c/dxwebsetup.exe" -OutFile '%temp%\DX.exe'"
start /wait "" "%temp%\DX.exe" /Q
goto apis


: VC
cls
echo Installing VisualC...
mkdir "%temp%\VC" >nul 2>&1
powershell "iwr "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -OutFile '%temp%\VC\VC2008x86.exe'"
powershell "iwr "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -OutFile '%temp%\VC\VC2008x64.exe'"
powershell "iwr "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -OutFile '%temp%\VC\VC2010x86.exe'"
powershell "iwr "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -OutFile '%temp%\VC\VC2010x64.exe'"
powershell "iwr "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -OutFile '%temp%\VC\VC2012x86.exe'"
powershell "iwr "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -OutFile '%temp%\VC\VC2012x64.exe'"
powershell "iwr "https://aka.ms/highdpimfc2013x86enu" -OutFile '%temp%\VC\VC2013x86.exe'"
powershell "iwr "https://aka.ms/highdpimfc2013x64enu" -OutFile '%temp%\VC\VC2013x64.exe'"
powershell "iwr "https://aka.ms/vc14/vc_redist.x86.exe" -OutFile '%temp%\VC\VCv14x86.exe'"
powershell "iwr "https://aka.ms/vc14/vc_redist.x64.exe" -OutFile '%temp%\VC\VCv14x64.exe'"
start /wait "" "%temp%\VC\VC2008x86.exe" /q
start /wait "" "%temp%\VC\VC2008x64.exe" /q
start /wait "" "%temp%\VC\VC2010x86.exe" /passive /norestart
start /wait "" "%temp%\VC\VC2010x64.exe" /passive /norestart
start /wait "" "%temp%\VC\VC2012x86.exe" /passive /norestart
start /wait "" "%temp%\VC\VC2012x64.exe" /passive /norestart
start /wait "" "%temp%\VC\VC2013x86.exe" /passive /norestart
start /wait "" "%temp%\VC\VC2013x64.exe" /passive /norestart
start /wait "" "%temp%\VC\VCv14x86.exe" /passive /norestart
start /wait "" "%temp%\VC\VCv14x64.exe" /passive /norestart
goto apis


: net8
cls
echo Installing .NET 8.0...
start /wait "" /min cmd.exe /c winget install Microsoft.DotNet.Runtime.8 --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apis


: net9
cls
echo Installing .NET 9.0...
start /wait "" /min cmd.exe /c winget install Microsoft.DotNet.Runtime.9 --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apis


: net10
cls
echo Installing .NET 10.0...
start /wait "" /min cmd.exe /c winget install Microsoft.DotNet.Runtime.10 --exact --silent --accept-package-agreements --accept-source-agreements >nul 2>&1
goto apis