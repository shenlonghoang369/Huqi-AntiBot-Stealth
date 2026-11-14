@echo off
chcp 65001 >nul
title Huqi Anti-Bot & Turnstile Bypass (Windows 10/11)

echo =======================================================
echo   HUQI ANTI-BOT ^& TURNSTILE BYPASS (WINDOWS 10/11)
echo =======================================================
echo.

cd /d "%~dp0"

if not exist ".venv" (
    echo [*] Dang tu dong tao moi truong ao Python .venv...
    python -m venv .venv
    call .venv\Scripts\activate.bat
    echo [*] Dang cai dat SeleniumBase...
    python -m pip install --upgrade pip
    pip install seleniumbase
) else (
    call .venv\Scripts\activate.bat
)

echo.
echo [*] Dang chay test Cloudflare Turnstile (UC Mode)...
python test_2captcha_turnstile.py

echo.
echo =======================================================
echo   HOAN TAT!
echo =======================================================
pause
