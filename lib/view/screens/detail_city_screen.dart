import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:openweather_mvvm/model/api/api_response.dart';
import 'package:openweather_mvvm/model/data/weather.dart';
import 'package:openweather_mvvm/utils/constants.dart';
import 'package:openweather_mvvm/utils/helper.dart';
import 'package:openweather_mvvm/view/widgets/button_section.dart';
import 'package:openweather_mvvm/view/widgets/header_section.dart';
import 'package:openweather_mvvm/view/widgets/information_card_section.dart';
import 'package:openweather_mvvm/view/widgets/main_section.dart';
import 'package:openweather_mvvm/view_model/weather_view_model.dart';
import 'package:provider/provider.dart';

class DetailCityScreen extends StatefulWidget {
  const DetailCityScreen({super.key, required this.cityName});

  final String cityName;

  @override
  State<DetailCityScreen> createState() => _DetailCityScreenState();
}

class _DetailCityScreenState extends State<DetailCityScreen> {
  Weather? savedWeather;

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    bool hasInternet = await checkInternetConnection();
    if (hasInternet) {
      fetchWeatherData();
    } else {
      fetchSavedWeatherData();
      _buildSnackBar("No internet connection");
    }
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> fetchSavedWeatherData() async {
    String? city = widget.cityName;
    await Provider.of<WeatherViewModel>(context, listen: false)
        .fetchWeatherFromDB(city);
    Weather? weather =
        Provider.of<WeatherViewModel>(context, listen: false).weather;
    setState(() {
      savedWeather = weather;
    });
  }

  void fetchWeatherData() {
    Provider.of<WeatherViewModel>(context, listen: false)
        .fetchWeatherData(widget.cityName);
    Weather? newWeather =
        Provider.of<WeatherViewModel>(context, listen: false).weather;
    if (newWeather != null) {
      setState(() {
        savedWeather = newWeather;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider.of<WeatherViewModel>(context).response;
    bool isLoading = apiResponse.status == Status.LOADING;
    // Weather? weather = apiResponse.data as Weather?;
    Weather? weather = savedWeather;
    String? message = apiResponse.message;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            color: Constants.skyBlue,
            child: SafeArea(
              child: Center(
                child: _buildMainContent(weather),
              ),
            ),
          ),
          if (isLoading) _buildLoadingContent(message)
        ],
      ),
    );
  }

  Widget _buildMainContent(Weather? weather) {
    Helper helper = Helper();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        HeaderSection(
            city: widget.cityName,
            updatedTime:
                weather != null ? weather.updatedAt.toString() : "00:00"),
        const SizedBox(
          height: 64,
        ),
        MainSection(
          mainTemp: weather != null
              ? helper.kelvinToCelcius(weather.temperature)
              : "0.0",
          minTemp: weather != null
              ? helper.kelvinToCelcius(weather.minTemperature)
              : "0.0",
          maxTemp: weather != null
              ? helper.kelvinToCelcius(weather.maxTemperature)
              : "0.0",
          status: weather != null ? weather.description.toString() : "0.0",
        ),
        const SizedBox(height: 100),
        InformationCardSection(
          sunrise: weather != null
              ? helper.unixTimeToAmPm(weather.sunrise)
              : "00:00",
          sunset:
              weather != null ? helper.unixTimeToAmPm(weather.sunset) : "00:00",
          wind: weather != null ? weather.windSpeed.toString() : "0.0",
          pressure: weather != null ? weather.pressure.toString() : "0.0",
          humidity: weather != null ? weather.humidity.toString() : "0.0",
          info: 'Data',
          update: fetchWeatherData,
        ),
        const SizedBox(height: 32),
        ButtonSection(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Back to List")
      ],
    );
  }

  Widget _buildLoadingContent(String? message) {
    return Container(
      color: Colors.black.withOpacity(0.6), // Semi-transparent overlay
      child: Center(
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: Constants.cardBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextSection(text: message!, size: 14),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                      strokeWidth: 2)),
            ],
          ),
        ),
      ),
    );
  }

  void _buildSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextSection(
      text: message,
      size: 14,
    )));
  }
}
