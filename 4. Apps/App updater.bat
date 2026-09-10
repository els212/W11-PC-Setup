@echo off
:: Fichier crée et edité par el.s212 le 10/09/2026 et mit à jour le 10/09/2026

: maj
::Montrer les maj
echo Updates available :
echo.
powershell "winget upgrade"
echo.

::Demander si maj auto des apps
echo 1 : Yes
echo 2 : No (Exit)

set /p choix="Do you want to update apps? : "

if "%choix%"=="1" goto oui
if "%choix%"=="2" goto non

cls
echo This choice is invalid, please try again :
pause
goto maj

:oui
cls
powershell "winget upgrade --all"
cls
echo Updates are done.
echo Press any key to exit...
pause >nul
exit

:non
exit