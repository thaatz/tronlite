::https://www.piriform.com/docs/defraggler/advanced-usage/command-line-parameters
cls
@echo off
pushd "%~dp0" 2>NUL
echo Running Defraggler . . .
df.exe %systemdrive%