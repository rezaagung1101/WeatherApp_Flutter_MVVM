class Weather {
  final String? city;
  final String? updatedAt;
  final String? description;
  final String? temperature;
  final String? minTemperature;
  final String? maxTemperature;
  final String? sunrise;
  final String? sunset;
  final String? speed;
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
    this.speed,
    this.pressure,
    this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'] as String?,
      updatedAt: (json['dt'] != null)
          ? DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000).toString()
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
      sunrise: json['sys'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000)
              .toString()
          : null,
      sunset: json['sys'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000)
              .toString()
          : null,
      speed: json['wind'] != null ? json['wind']['speed'].toString() : null,
      pressure:
          json['main'] != null ? json['main']['pressure'].toString() : null,
      humidity:
          json['main'] != null ? json['main']['humidity'].toString() : null,
    );
  }
}

// class Weather {
//   final String? city;
//   final String? updatedAt;
//   final String? description;
//   final String? temperature;
//   final String? minTemperature;
//   final String? maxTemperature;
//   final String? sunrise;
//   final String? sunset;
//   final String? speed;
//   final String? pressure;
//   final String? humidity;
//
//
//   Weather(
//       {this.city,
//         this.updatedAt,
//         this.description,
//         this.temperature,
//         this.minTemperature,
//         this.maxTemperature,
//         this.sunrise,
//         this.sunset,
//         this.speed,
//         this.pressure,
//         this.humidity});
//
//   factory Weather.fromJson(Map<String, dynamic> json){
//     return Weather(
//       city: json['name'] as String?,
//       updatedAt: json['timezone'] as String?,
//       description: json['description'] as String?,
//       temperature: json['temp'] as String?,
//       minTemperature: json['temp_min'] as String?,
//       maxTemperature: json['temp_max'] as String?,
//       sunrise: json['sunrise'] as String?,
//       sunset: json['sunset'] as String?,
//       speed: json['speed'] as String?,
//       pressure: json['pressure'] as String?,
//       humidity: json['humidity'] as String?,
//     );
//   }
//
// }
