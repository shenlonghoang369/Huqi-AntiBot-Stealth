#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

echo "=== ĐANG CHẠY TEST CLOUDFLARE TURNSTILE (SELENIUMBASE UC MODE) ==="
"$DIR/.venv/bin/python" "$DIR/test_2captcha_turnstile.py"

echo ""
echo "=== HOÀN TẤT ==="
read -p "Bấm phím bất kỳ để đóng cửa sổ..."
