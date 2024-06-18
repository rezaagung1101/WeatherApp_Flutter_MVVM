import 'package:openweather_mvvm/utils/helper.dart';

class Weather {
  final String? city;
  final String? updatedAt;
  final String? description;
  final String? temperature;
  final String? minTemperature;
  final String? maxTemperature;
  final String? sunrise;
  final String? sunset;
  final String? windSpeed;
  final String? pressure;
  final String? humidity;

  Weather({
    this.city,
    this.updatedAt,
    this.description,
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.sunrise,
    this.sunset,
    this.windSpeed,
    this.pressure,
    this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    Helper helper = Helper();
    return Weather(
      city: json['name'] as String?,
      updatedAt: (json['timezone'] != null)
          ? helper.timezoneOffsetToDate(json['timezone'].toString()) //I convert here because preventing the automatically update while converting at the home screen
          : null,
      description: json['weather'] != null && json['weather'].isNotEmpty
          ? json['weather'][0]['description'] as String?
          : null,
      temperature:
          json['main'] != null ? json['main']['temp'].toString() : null,
      minTemperature:
          json['main'] != null ? json['main']['temp_min'].toString() : null,
      maxTemperature:
          json['main'] != null ? json['main']['temp_max'].toString() : null,
      sunrise: json['sys'] != null ? json['sys']['sunrise'].toString() : null,
      sunset: json['sys'] != null ? json['sys']['sunset'].toString() : null,
      windSpeed: json['wind'] != null ? json['wind']['speed'].toString() : null,
      pressure:
          json['main'] != null ? json['main']['pressure'].toString() : null,
      humidity:
          json['main'] != null ? json['main']['humidity'].toString() : null,
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'city': city,
      'updatedAt': updatedAt,
      'description': description,
      'temperature': temperature,
      'minTemperature': minTemperature,
      'maxTemperature': maxTemperature,
      'sunrise': sunrise,
      'sunset': sunset,
      'windSpeed': windSpeed,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map){
    return Weather(
      city: map['city'],
      updatedAt: map['updatedAt'],
      description: map['description'],
      temperature: map['temperature'],
      minTemperature: map['minTemperature'],
      maxTemperature: map['maxTemperature'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
      windSpeed: map['windSpeed'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }
  
}
