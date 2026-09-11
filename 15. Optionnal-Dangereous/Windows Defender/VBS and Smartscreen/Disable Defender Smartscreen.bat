@echo off
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" /ve /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenPuaEnabled" /ve /t REG_DWORD /d 0 /f
taskkill /f /im smartscreen.exe
takeown /f "%windir%\System32\smartscreen.exe" /a
icacls "%windir%\System32\smartscreen.exe" /grant Administrateurs:F
ren "%windir%\System32\smartscreen.exe" "smartscreen.exee"
exit