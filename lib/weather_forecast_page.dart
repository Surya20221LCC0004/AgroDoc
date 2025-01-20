import 'package:flutter/material.dart';
import 'weather_service.dart'; // Import the WeatherService class

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  final WeatherService _weatherService = WeatherService();
  bool isWeatherFetched = false;
  String location = 'Bangalore'; // Default location
  double temperature = 0.0;
  int humidity = 0;
  String weatherCondition = '';
  double windSpeed = 0.0;

  // Method to fetch real-time weather data
  void fetchWeatherData() async {
    try {
      var weatherData = await _weatherService.getWeather(location);
      setState(() {
        temperature = weatherData['temperature'];
        humidity = weatherData['humidity'];
        weatherCondition = weatherData['weather'];
        windSpeed = weatherData['windSpeed'];
        isWeatherFetched = true;
      });
    } catch (e) {
      setState(() {
        isWeatherFetched = false;
      });
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$location Weather Forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 20),
              if (isWeatherFetched) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      size: 60,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$temperature°C',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Weather Condition: $weatherCondition',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Humidity: $humidity%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Wind Speed: $windSpeed m/s',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ] else ...[
                CircularProgressIndicator(), // Show a loading indicator while fetching data
                SizedBox(height: 20),
                Text(
                  'Loading weather data...',
                  style: TextStyle(fontSize: 18),
                ),
              ],
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: fetchWeatherData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Refresh Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
