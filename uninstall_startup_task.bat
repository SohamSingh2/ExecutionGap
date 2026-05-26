@echo off
setlocal
set "STARTUP_FILE=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Execution Gap Web App.cmd"

if exist "%STARTUP_FILE%" (
  del "%STARTUP_FILE%"
  echo Removed startup launcher:
  echo %STARTUP_FILE%
) else (
  echo Startup launcher was not found:
  echo %STARTUP_FILE%
)
