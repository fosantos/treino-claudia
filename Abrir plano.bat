@echo off
cd /d "%~dp0"
python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8787/index.html', timeout=1)" >nul 2>&1
if %errorlevel%==0 (
  start "" http://127.0.0.1:8787/index.html
  exit /b 0
)
start "Plano de treino" python -m http.server 8787 --bind 127.0.0.1
timeout /t 1 /nobreak >nul
start "" http://127.0.0.1:8787/index.html
