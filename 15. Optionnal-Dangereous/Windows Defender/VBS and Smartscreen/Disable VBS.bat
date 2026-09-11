@echo off
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t reg_dword /d 0 /f >nul >2&1
exit