@echo off
setlocal
cd /d "%~dp0"
if exist "%~dp0data\execution_gap.sqlite3" (
  explorer "%~dp0data"
) else (
  explorer "%USERPROFILE%\.execution_gap"
)
