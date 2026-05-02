# Flutter Weather App (Lab 4) 🌤️

**Sinh viên thực hiện:** Nguyễn Thanh Liêm  
**Mã số sinh viên:** 2224802010267  

---

## 📹 Video Báo Cáo (Demo Video)
👉 **Link Video Thuyết Trình:** **[Xem Video Demo Tại Đây](https://drive.google.com/file/d/1vzaCh2iZp3950lvUAFSai-jkbfC1X6bu/view?usp=sharing)**
*(Kính mời cô nhấn vào đường link trên để xem chi tiết phần thuyết trình cấu trúc code và demo chức năng chạy trên thiết bị thực tế của em ạ)*

---

## 📖 Giới thiệu (Introduction)
Dự án Weather Application được phát triển bằng Flutter nhằm đáp ứng đầy đủ các yêu cầu của bài Lab 4. Ứng dụng cung cấp tính năng dự báo thời tiết theo thời gian thực sử dụng API từ **OpenWeatherMap**, có hỗ trợ định vị GPS và lưu đệm dữ liệu Offline.

## 📂 Cấu trúc thư mục (Project Structure)
Dự án được tổ chức và triển khai theo mô hình State Management bằng `Provider` để tách biệt Logic và UI:
- `lib/models/`: Định nghĩa các lớp parse dữ liệu JSON (WeatherModel).
- `lib/services/`: Chứa các service xử lý tác vụ ngoại vi:
  - `weather_service.dart`: Xử lý logic gọi REST API.
  - `location_service.dart`: Xin quyền và lấy tọa độ GPS từ thiết bị.
  - `storage_service.dart`: Lưu trữ cache offline bằng Shared Preferences.
- `lib/providers/`: Nơi xử lý trạng thái (State) tập trung (`WeatherProvider`).
- `lib/screens/`: Các màn hình giao diện (HomeScreen, SearchScreen).
- `lib/widgets/`: Các thành phần giao diện được chia nhỏ (CurrentWeatherCard, HourlyForecast, ...).

## 🛠 Thư viện sử dụng (Dependencies)
- **[provider]**: Xử lý State Management mượt mà, hạn chế build lại toàn bộ UI.
- **[http]**: Gửi các phương thức GET request tới Server OpenWeatherMap.
- **[geolocator] & [geocoding]**: Cấp quyền định vị và trích xuất tọa độ hiện tại.
- **[shared_preferences]**: Chức năng Local Caching để ứng dụng vẫn hiển thị dữ liệu cũ khi mất kết nối mạng.
- **[flutter_dotenv]**: Đọc biến môi trường, dùng để bảo mật giấu kín API Key (tránh đưa lên Github).

## 🚀 Hướng dẫn khởi chạy (How to Run)
Để bảo mật, API Key không được đưa lên Github. Xin vui lòng làm theo các bước sau để chạy App:
1. Đảm bảo máy đã cài đặt Flutter SDK và clone repo này về.
2. Ở thư mục gốc của dự án, đổi tên file `.env.example` thành `.env`.
3. Thay thế dòng chữ trong file `.env` bằng API Key thật của OpenWeatherMap:
   `OPENWEATHER_API_KEY=your_actual_key`
4. Chạy lệnh `flutter pub get` để tải các thư viện.
5. Chạy ứng dụng bằng lệnh: `flutter run`
