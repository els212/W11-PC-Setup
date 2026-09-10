@echo off
for /f "delims=" %%i in ('powershell -NoProfile -Command "(Get-CimInstance Win32_VideoController).PNPDeviceID"') do (
	echo %%i | findstr /L "PCI\VEN_" >nul && (
		for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%i" /v "Driver" 2^>nul') do (
			for /f %%j in ('echo %%a ^| findstr "{"') do (
				reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%j" /v "DisableDynamicPstate" /t reg_dword /d "1" /f >nul 2>&1
			)
		)
	)
)
exit