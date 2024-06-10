import 'package:flutter/material.dart';
import 'package:openweather_mvvm/model/lib/city.dart';

class ListCityScreen extends StatelessWidget {
  ListCityScreen({super.key});

  final List<City> cityList = [
    City("New York", "images/new_york_city.png"),
    City("Singapore", "images/singapore_city.png"),
    City("Mumbai", "images/mumbai_city.png"),
    City("Delhi", "images/delhi_city.png"),
    City("Sydney", "images/sydney_city.png"),
    City("Melbourne", "images/melbourne_city.png"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
              // ListView.builder(),
          ],
        ),
      ),
    );
  }
}

class CityCardItem extends StatelessWidget {
  const CityCardItem(
      {super.key,
      required this.imagePath,
      required this.cityName,
      required this.onTap});

  final String imagePath;
  final String cityName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue[100],
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: double.infinity,
        height: 135,
        child: Card.filled(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      cityName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(imagePath), fit: BoxFit.cover)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

