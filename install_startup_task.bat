@echo off
setlocal
cd /d "%~dp0"

set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "STARTUP_FILE=%STARTUP_DIR%\Execution Gap Web App.cmd"

if not exist "%STARTUP_DIR%" (
  echo ERROR: Windows Startup folder was not found:
  echo %STARTUP_DIR%
  exit /b 1
)

> "%STARTUP_FILE%" echo @echo off
>> "%STARTUP_FILE%" echo cd /d "%~dp0"
>> "%STARTUP_FILE%" echo call "%~dp0start_always_local.bat"

if errorlevel 1 (
  echo ERROR: Could not create startup launcher:
  echo %STARTUP_FILE%
  exit /b 1
)

echo.
echo Execution Gap will start when you log into Windows.
echo Startup launcher:
echo %STARTUP_FILE%
echo Run uninstall_startup_task.bat to remove it.
