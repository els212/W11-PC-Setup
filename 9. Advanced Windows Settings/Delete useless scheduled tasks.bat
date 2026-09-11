@echo off
schtasks /Delete /TN "\Microsoft\Windows\Application Experience\MareBackup" /f
schtasks /Delete /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /f
schtasks /Delete /TN "\Microsoft\Windows\Hotpatch\Monitoring" /f
schtasks /Delete /TN "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /f
exit