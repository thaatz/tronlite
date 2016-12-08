@echo off
pushd "%~dp0" 2>NUL
call :read_settings settings.ini

title Buttfixer 3000
for /f "eol=# delims== tokens=1" %%i in (%SETTINGSFILE%) do (
	call "%%i"
)
pause

:read_settings
set SETTINGSFILE=%1
if not exist %SETTINGSFILE% (
	echo settings.ini does not exist
	pause
    exit
)
for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
    set %%i=%%j
)
exit /b 0