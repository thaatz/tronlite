@echo off
pushd %~dp0 2>NUL
:: first store the current cmd window color
color
:: change the color to white on blue
color 1f
echo.
echo.
REM echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
:: because of setlocal enabledelayedexpansion, we use double carrot, ^^, as escape characters for !
echo ^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!
echo ^^!^^!   JRT will run and a visual basic script will emulate keystrokes.          ^^!^^!
echo ^^!^^!   It is strongly advised you do not touch anything until JRT has           ^^!^^!
echo ^^!^^!   completed its course, otherwise the visual basic script will fail.       ^^!^^!
echo ^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!^^!
echo.
echo.
echo resuming in 5 seconds...
ping localhost -n 2 >nul
echo resuming in 4 seconds...
ping localhost -n 2 >nul
echo resuming in 3 seconds...
ping localhost -n 2 >nul
echo resuming in 2 seconds...
ping localhost -n 2 >nul
echo resuming in 1 second...
ping localhost -n 2 >nul
:: change the color back to normal
color 07
REM echo debug going
:: we call with start so that it opens in another process so we can start jrt right away
start wscript "jrt.vbs"
start jrt.exe
:: wait 90 seconds before we start the loop for jrt log detection
REM echo [debug] waiting 90 seconds
ping localhost -n 121 >nul
REM echo [debug] done
:: second wait period is only needed if we use vbs script to cancel the system restore point in JRT
REM echo [debug] starting second wait period
ping localhost -n 121 >nul

:: http://stackoverflow.com/questions/8177695/how-to-wait-for-a-process-to-terminate-to-execute-another-process-in-batch-file
:: http://stackoverflow.com/questions/162291/how-to-check-if-a-process-is-running-via-a-batch-script
:loop
tasklist /fi "WINDOWTITLE eq jrt*" 2>nul | find /i "notepad" >nul
if ERRORLEVEL 1 (
	:: this is what happens when it is not running
	REM echo [DEBUG] echo its not here yet
	ping localhost -n 5 >nul
	goto loop
) else (
	:: this is what happens when it is running
	goto continue
)

:continue
:: this is what happens after it runs
:: closing the jrt log file will complete jrt
taskkill /im notepad.exe /fi "WINDOWTITLE eq jrt*" >nul