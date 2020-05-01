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

 call :print Checking the services status. 
 
    sc query bits | findstr /I /C:"STOPPED" 
    if %errorlevel% NEQ 0 ( 
        echo.    Failed to stop the BITS service. 
        echo. 
        echo.Press any key to continue . . . 
        pause>nul 
        goto :eof 
    ) 
 
    call :print Checking the services status. 
 
    sc query wuauserv | findstr /I /C:"STOPPED" 
    if %errorlevel% NEQ 0 ( 
        echo.    Failed to stop the Windows Update service. 
        echo. 
        echo.Press any key to continue . . . 
        pause>nul 
        goto :eof 
    ) 

TAKEOWN /F <FILE LOCATION> ::put whatever file is corrupted or may need updates...


