@echo off
:: ----------------------------------------------------------------------------
:: USER SETTINGS
:: ----------------------------------------------------------------------------
set tronlog=%userprofile%\desktop\tronlite.log
:: ----------------------------------------------------------------------------

pushd "%~dp0" 2>NUL
REM call :read_settings settings.ini

fsutil dirty query %systemdrive% >NUL 2>&1
if /i not %ERRORLEVEL%==0 (
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

:main
title Tronlite
cls
:: internal count of scripts for the session
set /a cnt=0
for /f "eol=; delims=" %%i in (settings.ini) do (
	REM :: list out what we find in the settings.ini file
	echo %%i
	set /a cnt+=1
)
echo.
echo dont forget to double check settings.ini
echo.
echo  浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo  �                                Tronlite                                   �
echo  債陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo  � What should we do when we're done?                                        �
echo  �                                                                           �
echo  � 1. Restart (recommended)                                                  �
echo  � 2. Shutdown                                                               �
echo  � 0. Do nothing                                                             �
echo  藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
set /p exs=Make selection: 
if /i "%exs%"=="1" goto :m2
if /i "%exs%"=="2" goto :m2
if /i "%exs%"=="0" goto :m2
:: needed to add quotes for syntax in windows 8+
:: http://stackoverflow.com/questions/19308159/batch-simply-syntax-error-goto-was-unexpected-at-this-time
goto :main
pause

:m2
echo.
if /i "%exs%"=="1" set ext=%systemroot%\system32\shutdown.exe /r /f
if /i "%exs%"=="2" set ext=%systemroot%\system32\shutdown.exe /s /f
if /i "%exs%"=="0" set ext=
REM echo %ext%
REM pause

echo tronlite started on %date% at %time%>>"%tronlog%"
echo tronlite started on %date% at %time%
setlocal enabledelayedexpansion
set cnt2=0
:: this enables us to count within the for loop
:: http://stackoverflow.com/questions/7522740/counting-in-a-for-loop-using-windows-batch-script
REM for /f "eol=; tokens=1" %%i in (settings.ini) do (
for /f "eol=; delims=" %%i in (settings.ini) do (
	REM comments in this loop need to start with REM and not :: https://stackoverflow.com/questions/19843849/unexpected-the-system-cannot-find-the-drive-specified-in-batch-file
	REM :: we pushd every time to reset the current directory
	pushd "%~dp0" 2>NUL
	title Tronlite
	REM echo. >>"%tronlog%"
	set /a cnt2+=1
	echo ^(!cnt2!/%cnt%^) running %%i>>"%tronlog%"
	echo ^(!cnt2!/%cnt%^) running %%i
	call %%i
	REM :: you can use quotes around %%i and it would allow you to use path names with spaces, but it would disallow using arugments
	REM :: we take the quotes out here to allow additional arguments with some of the modules
)
endlocal
echo tronlite finished on %date% at %time%>>"%tronlog%"
echo.>>"%tronlog%"
%ext%
REM pause

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