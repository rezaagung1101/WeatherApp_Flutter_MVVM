import 'package:flutter/material.dart';
import 'package:openweather_mvvm/utils/constants.dart';
import 'package:openweather_mvvm/view/widgets/information_card_section.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                InformationCardSection(
                    sunrise: "06.30",
                    sunset: "17.39",
                    wind: "70kmh",
                    pressure: "0.5",
                    humidity: "0.0",
                    info: "Data")
              ],
            ),
          )),
    );
  }
}
