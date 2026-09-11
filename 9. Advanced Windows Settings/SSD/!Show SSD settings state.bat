@echo off
echo Affichage de l'etat des mises a jour du dernier acces...
fsutil behavior query disableLastAccess
echo.
echo.
echo Affichage de l'etat de TRIM...
fsutil behavior query Disabledeletenotify
pause
exit