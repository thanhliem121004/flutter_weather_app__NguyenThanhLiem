# Flutter Weather App

A comprehensive weather application using Flutter that fetches real-time weather data from OpenWeatherMap API.

## Features
- Current weather display with all details (temperature, feels like, humidity, wind, etc.)
- 5-day weather forecast and hourly forecast
- Location-based weather detection
- City search functionality
- Offline support with caching 
- Pull-to-refresh
- Dynamic UI based on weather conditions

## API Setup
1. Get free API key from OpenWeatherMap (https://openweathermap.org/api)
2. Copy `.env.example` to `.env`
3. Add your API key to `.env`

**IMPORTANT**: Never commit `.env` to version control. The repository ignores `.env` files for security.

## How to run
1. Clone this repository
2. Provide your API key in the `.env` file as shown above
3. Run `flutter pub get`
4. Run `flutter run` on your preferred device / emulator

## Technologies Used
- Flutter SDK
- Provider (State Management)
- http (API requests)
- geolocator & geocoding (Location services)
- shared_preferences (Local caching)
- cached_network_image
- flutter_dotenv

## Known Limitations
- Caching logic only stores the latest viewed city/location.
- Temperature unit conversion is partially implemented in UI settings but not fully wired yet (upcoming feature).

## Future Improvements
- Complete wiring of Temperature unit conversion
- Add more engaging Lottie animations for weather
- Implement interactive weather radar maps 
