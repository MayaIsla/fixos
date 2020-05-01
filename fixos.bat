@ECHO OFF
::This Batch file runs DISM (imaging) and SFC (fixing).
ECHO Running Windows OS Fixes...

ECHO==============================================
SFC /Scannow
Dism /Online /Cleanup-Image /StartComponentCleanup
Dism /Online /Cleanup-Image /RestoreHealth
chkdsk /r
perfmon /report
powercfg /batteryreport




