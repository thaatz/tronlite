pushd %~dp0 2>NUL
REM jrt.exe
:: on windows xp, we need to use start /wait for the script to wait
jrt.exe
:: http://stackoverflow.com/questions/8177695/how-to-wait-for-a-process-to-terminate-to-execute-another-process-in-batch-file
:: http://stackoverflow.com/questions/162291/how-to-check-if-a-process-is-running-via-a-batch-script
:loop
tasklist /fi "WINDOWTITLE eq jrt - notepad" 2>nul | find /i "notepad" >nul
if ERRORLEVEL 1 (
	:: this is what happens when it is not running
	REM cls
	REM echo its not here yet
	ping localhost -n 6 >nul
	goto loop
) else (
	:: this is what happens when it is running
	REM cls
	goto continue
)

:continue
:: this is what happens after it runs
:: restore the registry key we exported at the begining
echo.
taskkill /im notepad.exe /fi "WINDOWTITLE eq jrt - notepad" >nul
pause