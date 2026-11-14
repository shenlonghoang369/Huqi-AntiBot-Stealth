#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

echo "======================================================="
echo "   HUQI ANTI-BOT & TURNSTILE BYPASS (macOS ARM64 & Intel)"
echo "======================================================="
echo ""

if [ ! -d ".venv" ]; then
    echo "[*] Chưa có môi trường .venv, đang tự động tạo..."
    if command -v /opt/homebrew/bin/python3.12 &>/dev/null; then
        /opt/homebrew/bin/python3.12 -m venv .venv
    else
        python3 -m venv .venv
    fi
    echo "[*] Đang cài đặt thư viện SeleniumBase..."
    "$DIR/.venv/bin/pip" install seleniumbase
fi

echo "[*] Đang chạy test Cloudflare Turnstile (UC Mode)..."
"$DIR/.venv/bin/python" "$DIR/test_2captcha_turnstile.py"

echo ""
echo "======================================================="
echo "   HOÀN TẤT!"
echo "======================================================="
read -p "Bấm phím bất kỳ để đóng cửa sổ..."
