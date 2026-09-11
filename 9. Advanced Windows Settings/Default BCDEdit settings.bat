@echo off
:: Désactiver HPET
bcdedit /deletevalue useplatformclock
:: Désactiver l'économie d'énergie du timer Windows
bcdedit /set disabledynamictick yes
exit