# 🛡️ HUQI ANTI-BOT & CLOUDFLARE TURNSTILE STEALTH SYSTEM
**Hệ thống vượt rào cản tự động hóa dành riêng cho Hệ sinh thái Huqi (Huqi Ecosystem)**

---

## 🎯 Mục đích & Ứng dụng thực chiến
Tài liệu và mã nguồn chuẩn giải quyết triệt để vấn đề:
- **Khắc chế Cloudflare Turnstile:** Bị chặn khi cào số dư ví (`Huqi CDP Wallet Scanner`, `engine_cdp.py`, các cổng ví MBH, MT, JNC, PG, XM, BM, SX, YH).
- **Vượt Cloudflare IUAM (5s Shield):** Màn hình chờ "Just a moment...".
- **Che giấu 100% vân tay tự động hóa:** Xóa bỏ cờ `navigator.webdriver`, giả lập pointer/touch events, chuẩn hóa TLS/HTTP2 fingerprints.

---

## 🚀 Hướng dẫn kích hoạt nhanh

### 1. Khởi động môi trường ảo
```bash
source .venv/bin/activate
```

### 2. Chạy thử nghiệm giải Turnstile mẫu
```bash
python3 test_2captcha_turnstile.py
# Hoặc click đúp file: run_turnstile.command
```

---

## 💡 Cách tích hợp vào Tool Cào Ví (Huqi CDP Wallet Scanner)

Để nhúng trực tiếp vào script cào ví khi gặp cổng có Turnstile:

```python
from seleniumbase import SB

def scrape_wallet_portal(portal_url):
    # Kích hoạt chế độ Undetected ChromeDriver (uc=True)
    with SB(uc=True, test=True, ad_block=True) as sb:
        print(f"[*] Đang truy cập cổng ví: {portal_url}")
        
        # Mở trang và tạm ngắt kết nối DevTools để tránh Cloudflare phát hiện
        sb.uc_open_with_reconnect(portal_url, reconnect_time=4)
        sb.sleep(2)
        
        # Tự động phát hiện và click Turnstile nếu xuất hiện
        sb.uc_gui_click_captcha()
        sb.sleep(2)
        
        # Tiếp tục các thao tác đăng nhập / lấy số dư thông thường...
        print("[*] Đã vượt rào Turnstile thành công!")
```

---
*Tài sản thuộc quyền sở hữu của Hệ sinh thái Huqi — Bảo mật nội bộ.*

