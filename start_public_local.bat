@echo off
cd /d "%~dp0"
python run.py web --host 0.0.0.0 --port 8765
