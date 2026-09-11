@echo off
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t reg_dword /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t reg_dword /d 4 /f
exit