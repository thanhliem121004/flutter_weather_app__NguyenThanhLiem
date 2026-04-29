import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/forecast_model.dart';

class DailyForecastSection extends StatelessWidget {
  final List<ForecastModel> forecasts;

  const DailyForecastSection({required this.forecasts});

  @override
  Widget build(BuildContext context) {
    if (forecasts.isEmpty) return SizedBox.shrink();

    // The API might return multiple forecasts per day. We can filter to get one roughly mid-day forecast per day.
    // However, to keep it simple, let's group by day and take the first one or min/max.
    final Map<String, ForecastModel> dailyMap = {};
    for (var forecast in forecasts) {
      final date = DateFormat('yyyy-MM-dd').format(forecast.dateTime);
      if (!dailyMap.containsKey(date)) {
        dailyMap[date] = forecast;
      }
    }
    
    final dailyForecasts = dailyMap.values.take(5).toList();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '5-Day Forecast',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ...dailyForecasts.map((forecast) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      DateFormat('EEEE').format(forecast.dateTime),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https://openweathermap.org/img/wn/${forecast.icon}.png',
                        height: 30,
                        placeholder: (context, url) => SizedBox(width:30, height:30, child: CircularProgressIndicator(strokeWidth: 2)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${forecast.humidity}%',
                        style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${forecast.tempMin.round()}°',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        ' / ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${forecast.tempMax.round()}°',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
