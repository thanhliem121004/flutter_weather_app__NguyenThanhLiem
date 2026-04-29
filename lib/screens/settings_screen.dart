import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.thermostat),
            title: Text('Temperature Unit'),
            subtitle: Text('Celsius (°C)'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Feature coming soon!')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.air),
            title: Text('Wind Speed Unit'),
            subtitle: Text('m/s'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Feature coming soon!')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            subtitle: Text('Weather App v1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
