
import 'package:weather_project/model/weathermodel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


class WeatherService {
final String apiKey = '8e3d8e3b683ef069b2930e918ac7c188';

Future<WeatherModel> fetchWeatherByCityName(String cityName) async {
final response = await http.get(
Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'),
);

if (response.statusCode == 200) {
  return WeatherModel.fromJson(json.decode(response.body));
} else {
  throw Exception('Failed to load weather data');
}

}
}