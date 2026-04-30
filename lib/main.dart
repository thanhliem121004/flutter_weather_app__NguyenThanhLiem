import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'services/weather_service.dart';
import 'services/location_service.dart';
import 'services/storage_service.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: ".env");
  
  final String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? const String.fromEnvironment('OPENWEATHER_API_KEY');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(
            // We pass the API key from variables
            WeatherService(apiKey: apiKey),
            LocationService(),
            StorageService(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1E1E2C),
        scaffoldBackgroundColor: Color(0xFF1E1E2C),
        appBarTheme: AppBarTheme(
          color: Color(0xFF1E1E2C),
          elevation: 0,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto'),
          bodyMedium: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
