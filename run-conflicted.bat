@echo off
:: ----------------------------------------------------------------------------
:: USER SETTINGS
:: ----------------------------------------------------------------------------
set tronlog=%userprofile%\desktop\tronlite.log
:: ----------------------------------------------------------------------------

pushd "%~dp0" 2>NUL
REM call :read_settings settings.ini

<<<<<<< HEAD
title tronlite
:main
cls
=======
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


title Buttfixer 3000
echo tronlite %date% at %time%>>"%tronlog%"
>>>>>>> origin/master
for /f "eol=; delims== tokens=1" %%i in (settings.ini) do (
	:: we pushd every time to reset the current directory
<<<<<<< HEAD
	echo "%%i"
)
echo.
echo dont forget to double check settings.ini
echo.
echo ################################################################################
echo #                                  Tronlite                                    #
echo ################################################################################
echo # What should we do when we're done?                                           #
echo #                                                                              #
echo # 1. Restart (recommended)                                                     #
echo # 2. Shutdown                                                                  #
echo # 0. Do nothing                                                                #
REM echo #
echo ################################################################################
set /p exs=Make selection: 
if /i %exs%=="1" goto m2
if /i %exs%=="2" goto m2
if /i %exs%=="0" goto m2
goto main
REM pause

:m2
if /i %exs%==1 set ext="shutdown /r /f"
if /i %exs%==2 set ext="shutdown /s /f"
if /i %exs%==0 set ext=
REM echo %ext%
REM pause

for /f "eol=; delims== tokens=1" %%i in (settings.ini) do (
	pushd "%~dp0" 2>NUL
	:: we pushd every time to reset the current directory
	REM call "%~dp0%%i"
	call "%%i"
)
REM pause
::nul to suppress echo is off message when we are told to do nothing
%ext% >nul
=======
	pushd "%~dp0" 2>NUL
	echo. >>"%tronlog%"
	echo %time% running %%i>>"%tronlog%"
	call "%%i"
)
echo tronlite finished on %date% at %time%>>"%tronlog%"
echo. >>"%tronlog%"
>>>>>>> origin/master
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