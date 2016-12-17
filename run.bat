@echo off
set tronlog=%userprofile%\desktop\tronlite.log
pushd "%~dp0" 2>NUL
REM call :read_settings settings.ini

fsutil dirty query %systemdrive% >NUL 2>&1
if /i not !ERRORLEVEL!==0 (
	color cf
	cls
	echo.
	echo  ERROR
	echo.
	echo  Looks like you are not running this as admin.
	echo.
	echo  Close this window and re-run as an Administrator.
	echo.
	pause
	exit /b 1	)


title Buttfixer 3000
echo tronlite %date% at %time%>>"%tronlite%"
for /f "eol=; delims== tokens=1" %%i in (settings.ini) do (
	:: we pushd every time to reset the current directory
	pushd "%~dp0" 2>NUL
	echo. >>"%tronlite%"
	echo %time% running %%i>>"%tronlite%"
	call "%%i"
)
echo tronlite finished on %date% at %time%>>"%tronlite%"
echo. >>"%tronlite%"
pause

REM :read_settings
REM set SETTINGSFILE=%1
REM if not exist %SETTINGSFILE% (
	REM echo settings.ini does not exist
	REM pause
    REM exit
REM )
REM for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
    REM set %%i=%%j
REM )
REM exit /b 0