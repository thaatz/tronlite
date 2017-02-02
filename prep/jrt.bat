pushd %~dp0 2>NUL
REM jrt.exe
:: on windows xp, we need to use start /wait for the script to wait
start /wait jrt.exe
REM pause