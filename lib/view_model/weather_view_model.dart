import 'package:flutter/cupertino.dart';
import 'package:openweather_mvvm/model/api/api_response.dart';
import 'package:openweather_mvvm/model/data/weather.dart';
import 'package:openweather_mvvm/model/database/database_helper.dart';
import 'package:openweather_mvvm/model/repository/weather_repository.dart';

class WeatherViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Empty data");

  Weather? _weather;

  ApiResponse get response {
    return _apiResponse;
  }

  Weather? get weather {
    return _weather;
  }

  Future<void> fetchWeatherData(String city) async {
    _apiResponse = ApiResponse.loading('Fetching weather data');
    notifyListeners();
    try {
      //fetch froom API
      Weather weather = await WeatherRepository().fetchWeatherData(city);
      _weather = weather;
      _apiResponse = ApiResponse.completed("Succes fetching : $weather");
      //save to db
      await DatabaseHelper().insertWeather(weather);
      // }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  Future<void> fetchWeatherFromDB(String city) async {
    _apiResponse = ApiResponse.loading('Fetching weather data');
    notifyListeners();
    try {
      Weather? weather = await DatabaseHelper().getWeather(city);
      if (weather != null) {
        _weather = weather;
        _apiResponse = ApiResponse.completed("Succes fetching : $weather");
      } else {
        fetchWeatherData(city);
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  Future<void> fetchWeatherDataByLocation(double lat, double lon) async {
    _apiResponse = ApiResponse.loading('Fetching weather data');
    notifyListeners();
    try {
      Weather weather =
          await WeatherRepository().fetchWeatherDataByLocation(lat, lon);
      _weather = weather;
      _apiResponse = ApiResponse.completed("Succes fetching : $weather");
      await DatabaseHelper().insertWeather(weather);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }
}
