import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '23bb804847a9fbafcc6872ba3b656879'; // Your OpenWeatherMap API key

  // Method to fetch weather data from the API
  Future<Map<String, dynamic>> getWeather(String location) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric'; // units=metric for Celsius
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the response data
      final Map<String, dynamic> data = json.decode(response.body);
      return {
        'temperature': data['main']['temp'],
        'humidity': data['main']['humidity'],
        'weather': data['weather'][0]['description'],
        'windSpeed': data['wind']['speed'],
      };
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
