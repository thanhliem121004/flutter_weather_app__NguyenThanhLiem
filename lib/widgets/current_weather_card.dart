import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';

class CurrentWeatherCard extends StatelessWidget {
  final WeatherModel weather;
  
  const CurrentWeatherCard({required this.weather});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: _getWeatherGradient(weather.mainCondition),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            weather.cityName,
            style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            DateFormat('EEEE, MMM d').format(weather.dateTime),
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          SizedBox(height: 20),
          CachedNetworkImage(
            imageUrl: 'https://openweathermap.org/img/wn/${weather.icon}@4x.png',
            height: 120,
            placeholder: (context, url) => CircularProgressIndicator(color: Colors.white),
            errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.white),
          ),
          Text(
            '${weather.temperature.round()}°',
            style: TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          Text(
            weather.description.toUpperCase(),
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Text(
            'Feels like ${weather.feelsLike.round()}°',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
  
  LinearGradient _getWeatherGradient(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return LinearGradient(
          colors: [Color(0xFFFDB813), Color(0xFF87CEEB)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'rain':
      case 'drizzle':
        return LinearGradient(
          colors: [Color(0xFF4A5568), Color(0xFF718096)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'clouds':
        return LinearGradient(
          colors: [Color(0xFFA0AEC0), Color(0xFFCBD5E0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'snow':
        return LinearGradient(
          colors: [Color(0xFFE2E8F0), Color(0xFFFFFFFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'thunderstorm':
        return LinearGradient(
          colors: [Color(0xFF2D3748), Color(0xFF1A202C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      default:
        // Night or unrecognized
        return LinearGradient(
          colors: [Color(0xFF2D3748), Color(0xFF1A202C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
    }
  }
}
