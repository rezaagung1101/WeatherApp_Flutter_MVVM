import 'package:flutter/cupertino.dart';
import 'package:openweather_mvvm/model/api/api_response.dart';
import 'package:openweather_mvvm/model/lib/weather.dart';
import 'package:openweather_mvvm/model/repository/weather_repository.dart';

class WeatherViewModel with ChangeNotifier{
  ApiResponse _apiResponse = ApiResponse.initial("Empty data");

  Weather? _weather;

  ApiResponse get response{
    return _apiResponse;
  }

  Weather? get weather{
    return _weather;
  }

  Future<void> fetchWeatherData(String city) async{
    _apiResponse = ApiResponse.loading('Fetching weather data');
    notifyListeners();
    try{
      Weather weather = await WeatherRepository().fetchWeatherData(city);
      _apiResponse = ApiResponse.completed(weather);
    } catch (e){
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setSelectedWeather(Weather? weather){
    _weather = weather;
    notifyListeners();
  }
}