@echo off
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t reg_dword /d 4 /f
exit