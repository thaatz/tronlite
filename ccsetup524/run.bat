:: https://www.piriform.com/docs/ccleaner/advanced-usage/command-line-parameters
cls
@echo off
pushd "%~dp0" 2>NUL
echo Running CCleaner . . .
ccleaner.exe /auto
echo Finished
echo.