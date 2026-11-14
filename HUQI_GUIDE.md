# 🛡️ HUQI ANTI-BOT & CLOUDFLARE TURNSTILE STEALTH SYSTEM
**Hệ thống tự động hóa tàng hình đa nền tảng (macOS & Windows 10/11)**

---

## 🎯 Mục đích & Ứng dụng thực chiến
Tài liệu và mã nguồn chuẩn giải quyết triệt để vấn đề:
- **Khắc chế Cloudflare Turnstile:** Bị chặn khi cào số dư ví (`Huqi CDP Wallet Scanner`, `engine_cdp.py`, các cổng ví MBH, MT, JNC, PG, XM, BM, SX, YH).
- **Vượt Cloudflare IUAM (5s Shield):** Màn hình chờ "Just a moment...".
- **Che giấu 100% vân tay tự động hóa:** Xóa bỏ cờ `navigator.webdriver`, giả lập pointer/touch events, chuẩn hóa TLS/HTTP2 fingerprints.

---

## 🚀 Kích hoạt 1-Click (Hỗ trợ 100% cả macOS và Windows)

### 🍎 Dành cho macOS (MacBook, Mac Mini / Chip Apple Silicon M1-M4 & Intel):
Click đúp trực tiếp vào file:
👉 **`run_turnstile.command`**  
*(Script sẽ tự động khởi tạo môi trường ảo `.venv`, tự cài `seleniumbase` nếu chưa có và bật Chrome lên chạy)*

---

### 🪟 Dành cho Windows (Windows 10 & 11):
Click đúp trực tiếp vào file:
👉 **`run_turnstile.bat`**  
*(Tự động phát hiện môi trường, cài đặt dependency và chạy Chrome tàng hình)*

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
