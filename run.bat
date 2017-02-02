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


title Tronlite
:main
cls
for /f "eol=; delims== tokens=1" %%i in (settings.ini) do (
	:: list out what we find in the settings.ini file
	echo "%%i"
)
echo.
echo dont forget to double check settings.ini
echo.
echo  ���������������������������������������������������������������������������ͻ
echo  �                                Tronlite                                   �
echo  ���������������������������������������������������������������������������ĺ
echo  � What should we do when we're done?                                        �
echo  �                                                                           �
echo  � [1] Restart (recommended)                                                 �
echo  � [2] Shutdown                                                              �
echo  � [0] Do nothing                                                            �
echo  ���������������������������������������������������������������������������ͼ
set /p exs=Make selection: 
if /i "%exs%"=="1" goto :m2
if /i "%exs%"=="2" goto :m2
if /i "%exs%"=="0" goto :m2
:: needed to add quotes for syntax in windows 8+
:: http://stackoverflow.com/questions/19308159/batch-simply-syntax-error-goto-was-unexpected-at-this-time
goto :main
pause

:m2
if /i "%exs%"=="1" set ext="shutdown /r /f"
if /i "%exs%"=="2" set ext="shutdown /s /f"
if /i "%exs%"=="0" set ext=
echo %ext%
pause

echo tronlite %date% at %time%>>"%tronlog%"
for /f "eol=; delims== tokens=1" %%i in (settings.ini) do (
	:: we pushd every time to reset the current directory
	pushd "%~dp0" 2>NUL
	echo. >>"%tronlog%"
	echo running %%i>>"%tronlog%"
	call "%%i"
)
echo tronlite finished on %date% at %time%>>"%tronlog%"
echo. >>"%tronlog%"
%ext% >nul
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