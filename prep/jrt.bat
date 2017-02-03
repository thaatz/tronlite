@echo off
pushd %~dp0 2>NUL
:: we call with start so that it opens in another process so we can start jrt right away
start wscript "jrt.vbs"
jrt.exe
:: http://stackoverflow.com/questions/8177695/how-to-wait-for-a-process-to-terminate-to-execute-another-process-in-batch-file
:: http://stackoverflow.com/questions/162291/how-to-check-if-a-process-is-running-via-a-batch-script
:loop
tasklist /fi "WINDOWTITLE eq jrt*" 2>nul | find /i "notepad" >nul
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
taskkill /im notepad.exe /fi "WINDOWTITLE eq jrt*" >nul