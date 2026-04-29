import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  
  void _searchCity(String cityName) {
    if (cityName.trim().isEmpty) return;
    
    // Unfocus keyboard
    FocusScope.of(context).unfocus();
    
    // Fetch weather
    context.read<WeatherProvider>().fetchWeatherByCity(cityName.trim()).then((_) {
      if (mounted && context.read<WeatherProvider>().state == WeatherState.loaded) {
        Navigator.pop(context); // Return to home on success
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.read<WeatherProvider>().errorMessage),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter city name (e.g., London, Tokyo)',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: _searchCity,
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _searchCity(_searchController.text),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Search Weather', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
