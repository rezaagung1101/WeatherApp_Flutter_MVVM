import 'package:openweather_mvvm/model/lib/weather.dart';
import 'package:openweather_mvvm/model/services/base_service.dart';
import 'package:openweather_mvvm/model/services/weather_service.dart';

class WeatherRepository {
  BaseService _weatherService = WeatherService();

  Future<Weather> fetchWeatherData(String city) async {
    dynamic response = await _weatherService.getResponse(city);
    return Weather.fromJson(response);
  }
}
