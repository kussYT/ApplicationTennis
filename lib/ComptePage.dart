import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherData {
  final String main;
  final String description;
  final double temperature;

  WeatherData({
    required this.main,
    required this.description,
    required this.temperature,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    return WeatherData(
      main: weather['main'],
      description: weather['description'],
      temperature:
          (main['temp'] - 273.15).toDouble(), // Conversion de Kelvin en Celsius
    );
  }
}

class ComptePage extends StatefulWidget {
  const ComptePage({super.key});

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<ComptePage> {
  final TextEditingController _searchController = TextEditingController();
  WeatherData? _weatherData;
  String _tennisRecommendation = '';

  Future<WeatherData?> fetchWeatherData(String city) async {
    const apiKey = 'a34a3e97c9260c9b6efcaab18fa37532';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final weatherData = WeatherData.fromJson(data);
        return weatherData;
      } else {
        setState(() {
          _weatherData = null;
          _tennisRecommendation = 'Failed to fetch weather data';
        });
      }
    } catch (error) {
      setState(() {
        _weatherData = null;
        _tennisRecommendation = 'An error occurred: $error';
      });
    }
    return null;
  }

  String getTennisRecommendation(WeatherData weatherData) {
    if (weatherData.temperature > 15 &&
        !weatherData.description.contains('rain')) {
      return 'Jouez dehors !';
    } else {
      return 'Jouez en intérieur !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.sports_tennis),
            SizedBox(width: 8.0),
            Text('Tennis App'),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.orangeAccent, Colors.orange], // Dégradé de couleurs
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Ville',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final city = _searchController.text;
                final weatherData = await fetchWeatherData(city);
                if (weatherData != null) {
                  final tennisRecommendation =
                      getTennisRecommendation(weatherData);
                  setState(() {
                    _weatherData = weatherData;
                    _tennisRecommendation = tennisRecommendation;
                  });
                }
              },
              child: const Text('Obtenir la météo'),
            ),
            const SizedBox(height: 20.0),
            if (_weatherData != null)
              Column(
                children: [
                  const Text(
                    'Météo actuelle',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Description: ${_weatherData!.description}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Température: ${_weatherData!.temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20.0),
            Text(
              _tennisRecommendation,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
