from seleniumbase import SB

print("[*] Khởi động Chrome ở chế độ Undetected (UC Mode)...")
with SB(uc=True, test=True) as sb:
    url = "https://2captcha.com/demo/cloudflare-turnstile"
    print(f"[*] Mở trang: {url}")
    sb.uc_open_with_reconnect(url, reconnect_time=4)
    sb.sleep(2)

    print("[*] Đang phát hiện và tự động click Turnstile...")
    sb.uc_gui_click_captcha()

    print("[*] Đã click xong! Chờ 5 giây để quan sát kết quả tích xanh...")
    sb.sleep(5)
    
    # Kiểm tra nút Check xem đã sẵn sàng chưa
    if sb.is_element_visible('button:contains("Check")'):
        print("[*] Bấm nút Check để xác thực kết quả...")
        sb.click('button:contains("Check")')
        sb.sleep(3)
        
    print("[*] Hoàn tất quá trình test!")

