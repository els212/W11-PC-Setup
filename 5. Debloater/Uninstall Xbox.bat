@echo off
:: Fichier crée et edité par el.s212 le 10/09/2026 et mit à jour le 10/09/2026
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t reg_dword /d 00000000 /f >nul 2>&1
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled /t reg_dword /d 00000000 /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t reg_dword /d 00000000 /f >nul 2>&1
powershell "Get-AppxPackage -AllUsers Microsoft.GamingApp | Remove-AppxPackage -AllUsers"
powershell "Get-AppxPackage -AllUsers Microsoft.GamingServices | Remove-AppxPackage -AllUsers"
powershell "Get-AppxPackage -AllUsers Microsoft.XboxGamingOverlay | Remove-AppxPackage -AllUsers"
powershell "Get-AppxPackage -AllUsers Microsoft.Xbox.TCUI | Remove-AppxPackage -AllUsers"
powershell "Get-AppxPackage -AllUsers Microsoft.XboxIdentityProvider | Remove-AppxPackage -AllUsers"
powershell "Get-AppxPackage -AllUsers Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage -AllUsers"
exit