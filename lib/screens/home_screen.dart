import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/hourly_forecast_list.dart';
import '../widgets/daily_forecast_section.dart';
import '../widgets/weather_details_section.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/error_widget.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load weather on app start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().fetchWeatherByLocation();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              context.read<WeatherProvider>().fetchWeatherByLocation();
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1E1E2C), // Dark base color, overridden by cards mostly
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => context.read<WeatherProvider>().refreshWeather(),
            child: Consumer<WeatherProvider>(
              builder: (context, provider, child) {
                if (provider.state == WeatherState.loading) {
                  return LoadingShimmer();
                }
                
                if (provider.state == WeatherState.error && provider.currentWeather == null) {
                  return ErrorWidgetCustom(
                    message: provider.errorMessage,
                    onRetry: () => provider.fetchWeatherByLocation(),
                  );
                }
                
                if (provider.currentWeather == null) {
                  return Center(
                    child: Text(
                      'No weather data available.\nTry searching for a city.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  );
                }
                
                // If there's an error but we still have cached weather, show a small warning
                return Stack(
                  children: [
                    SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          CurrentWeatherCard(weather: provider.currentWeather!),
                          HourlyForecastList(forecasts: provider.forecast),
                          DailyForecastSection(forecasts: provider.forecast),
                          WeatherDetailsSection(weather: provider.currentWeather!),
                          SizedBox(height: 40), // Padding at bottom
                        ],
                      ),
                    ),
                    if (provider.state == WeatherState.error)
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.redAccent.withOpacity(0.8),
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Center(
                            child: Text(
                              'Offline: Showing cached data',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
