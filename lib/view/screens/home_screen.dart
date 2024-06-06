import 'package:flutter/material.dart';
import 'package:openweather_mvvm/utils/constants.dart';
import 'package:openweather_mvvm/view/widgets/information_card_section.dart';
import 'package:openweather_mvvm/view/widgets/main_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        color: Constants.skyBlue,
        // child: const SingleChildScrollView(
        child: const Center(
          child: Column(
            children: <Widget>[
              MainSection(
                  mainTemp: "0.0",
                  minTemp: "0.0",
                  maxTemp: "0.0",
                  status: "Cloudy af"),
              SizedBox(
                height: 32,
              ),
              InformationCardSection(
                  sunrise: "06.30",
                  sunset: "17.39",
                  wind: "70kmh",
                  pressure: "0.5",
                  humidity: "0.0",
                  info: "Data")
            ],
          ),
        ),
        // )
      ),
    );
  }
}
