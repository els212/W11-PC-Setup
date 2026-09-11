@echo off
powercfg /h off
powercfg /import "%~dp0Performances optimales (Optimise).pow" 99999999-9999-9999-9999-999999999999
powercfg /setactive 99999999-9999-9999-9999-999999999999
exit