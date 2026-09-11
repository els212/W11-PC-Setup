@echo off
for /f "delims=" %%a in ('powershell -NoProfile -Command "(Get-CimInstance Win32_USBHub).DeviceID"') do (
	echo %%a | findstr /L "VID_" >nul && (
		reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v "EnhancedPowerManagementEnabled" /t reg_dword /d 0 /f
		reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v "AllowIdleIrpInD3" /t reg_dword /d 0 /f
		reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendOn" /t reg_dword /d 0 /f
		reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v "DeviceSelectiveSuspended" /t reg_dword /d 0 /f
		reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendEnabled" /t reg_dword /d 0 /f
		reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%a\Device Parameters" /v "IdleInWorkingState" /t reg_dword /d 0 /f
	)
)
exit