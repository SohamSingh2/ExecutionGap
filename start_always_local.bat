@echo off
setlocal
cd /d "%~dp0"
if not exist data mkdir data

echo Starting Execution Gap...
echo.
echo App URL:
echo   http://127.0.0.1:8765
echo.
echo Database file:
echo   %~dp0data\execution_gap.sqlite3
echo.
echo Keep this window open while you use the app.
echo Press Ctrl+C to stop it.
echo.

python run.py web --host 0.0.0.0 --port 8765 --db "%~dp0data\execution_gap.sqlite3"
