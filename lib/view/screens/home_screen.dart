import 'package:flutter/material.dart';
import 'package:openweather_mvvm/utils/helper.dart';
import 'package:openweather_mvvm/view/widgets/header_section.dart';
import 'package:provider/provider.dart';
import 'package:openweather_mvvm/model/api/api_response.dart';
import 'package:openweather_mvvm/model/lib/weather.dart';
import 'package:openweather_mvvm/utils/constants.dart';
import 'package:openweather_mvvm/view/widgets/information_card_section.dart';
import 'package:openweather_mvvm/view/widgets/main_section.dart';
import 'package:openweather_mvvm/view_model/weather_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() {
    Provider.of<WeatherViewModel>(context, listen: false)
        .fetchWeatherData(Constants.city);
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider
        .of<WeatherViewModel>(context)
        .response;
    bool isLoading = apiResponse.status == Status.LOADING;
    Weather? weather = apiResponse.data as Weather?;

    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            color: Constants.skyBlue,
            child: SafeArea(
              child: Center(
                child: _buildMainContent(weather),
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              child: const Center(
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.blue,
                        strokeWidth: 2)),
              ),
            ),
        ],
      ),
    );
  }

  //this can be used when you want to replace the whole widget with progress bar or displaying the loading widget (just like My Telkomsel app)
  // Widget _buildBody(ApiResponse apiResponse) {
  //   _buildMainContent(apiResponse.data as Weather);
  //   switch (apiResponse.status) {
  //     case Status.LOADING:
  //       return _buildMainContent(apiResponse.data as Weather?);
  //     case Status.COMPLETED:
  //       return _buildMainContent(apiResponse.data as Weather);
  //     case Status.ERROR:
  //       return Text(apiResponse.message ?? "Error occurred");
  //     case Status.INITIAL:
  //     default:
  //       return const Text("No data");
  //   }
  // }

  Widget _buildMainContent(Weather? weather) {
    // if (weather == null) {
    //   return const SizedBox.shrink();
    // }
    Helper helper = Helper();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16,),
        HeaderSection(city: Constants.city,
            updatedTime: weather != null ? helper.timezoneOffsetToDate(weather.updatedAt) : "00.00"),
        const SizedBox(height: 32,),
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
        const SizedBox(height: 64),
        InformationCardSection(
          sunrise: weather != null
              ? helper.unixTimeToAmPm(weather.sunrise)
              : "00.00",
          sunset:
          weather != null ? helper.unixTimeToAmPm(weather.sunset) : "00.00",
          wind: weather != null ? weather.windSpeed.toString() : "0.0",
          pressure: weather != null ? weather.pressure.toString() : "0.0",
          humidity: weather != null ? weather.humidity.toString() : "0.0",
          info: 'Data',
          update: fetchWeatherData,
        ),
      ],
    );
  }
}
