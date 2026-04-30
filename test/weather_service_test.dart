import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather_model.dart';

void main() {
  group('WeatherService Tests', () {
    test('Parse weather JSON correctly', () {
      final json = {
        'name': 'Ho Chi Minh City',
        'sys': {'country': 'VN'},
        'main': {
          'temp': 25.0,
          'feels_like': 28.0,
          'humidity': 80,
          'pressure': 1012,
          'temp_min': 24.0,
          'temp_max': 27.0,
        },
        'wind': {'speed': 3.5},
        'weather': [
          {
            'description': 'few clouds',
            'icon': '02d',
            'main': 'Clouds',
          }
        ],
        'dt': 1618317040,
        'visibility': 10000,
        'clouds': {'all': 20},
      }; 

      final weather = WeatherModel.fromJson(json);
      
      expect(weather.temperature, 25.0);
      expect(weather.cityName, 'Ho Chi Minh City');
      expect(weather.country, 'VN');
      expect(weather.humidity, 80);
      expect(weather.description, 'few clouds');
    });
  });
}
