@echo off
setlocal enabledelayedexpansion

NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Requesting administrator permissions...
    powershell -Command "Start-Process cmd -ArgumentList '/s,/c,%~0' -Verb RunAs"
    exit /b
)

title Windows: Winget
WinGet upgrade --all
pause