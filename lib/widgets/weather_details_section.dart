import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'package:intl/intl.dart';

class WeatherDetailsSection extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDetailsSection({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildDetailCard(
                  title: 'Humidity',
                  value: '${weather.humidity}%',
                  icon: Icons.water_drop,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildDetailCard(
                  title: 'Wind Speed',
                  value: '${weather.windSpeed} m/s',
                  icon: Icons.air,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDetailCard(
                  title: 'Pressure',
                  value: '${weather.pressure} hPa',
                  icon: Icons.compress,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildDetailCard(
                  title: 'Visibility',
                  value: weather.visibility != null 
                      ? '${(weather.visibility! / 1000).toStringAsFixed(1)} km'
                      : 'N/A',
                  icon: Icons.visibility,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 30),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
