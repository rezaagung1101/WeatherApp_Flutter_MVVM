import 'package:flutter/material.dart';
import 'package:openweather_mvvm/utils/constants.dart';

class InformationCardSection extends StatelessWidget {
  const InformationCardSection(
      {super.key,
      required this.sunrise,
      required this.sunset,
      required this.wind,
      required this.pressure,
      required this.humidity,
      required this.info});

  final String sunrise;
  final String sunset;
  final String wind;
  final String pressure;
  final String humidity;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 8, width: 16,),
              Expanded(
                child: CardItem(
                  imagePath: "images/sunrise.png",
                  label: "Sunrise",
                  value: sunrise,
                ),
              ),
              const SizedBox(width: 4,),
              Expanded(
                child: CardItem(
                  imagePath: "images/sunset.png",
                  label: "Sunset",
                  value: sunset,
                ),
              ),
              const SizedBox(width: 4,),
              Expanded(
                child: CardItem(
                  imagePath: "images/wind.png",
                  label: "Wind",
                  value: wind,
                ),
              ),
              const SizedBox(width: 16,),
            ],
          ),
        ),
        const SizedBox(height: 4,),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 16,),
              Expanded(
                child: CardItem(
                  imagePath: "images/pressure.png",
                  label: "Pressure",
                  value: pressure,
                ),
              ),
              const SizedBox(width: 4,),
              Expanded(
                child: CardItem(
                  imagePath: "images/humidity.png",
                  label: "Humidity",
                  value: humidity,
                ),
              ),
              const SizedBox(width: 4,),
              Expanded(
                child: CardItem(
                  imagePath: "images/info.png",
                  label: "Update",
                  value: info,
                ),
              ),
              const SizedBox(width: 16,),
            ],
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.imagePath,
      required this.label,
      required this.value});

  final String imagePath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Constants.cardBackground,
            // color: Colors.grey[200], // Adjust color as needed
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath,
                width: 25, // Adjust width as needed
                height: 25, // Adjust height as needed
                color: Colors.white, // Apply white tint
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 80,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardItem(
//                   imagePath: "images/sunrise.png",
//                   label: "Sunrise",
//                   value: sunrise),
//               CardItem(imagePath: "images/sunset.png",
//                   label: "Sunset",
//                   value: sunset),
//               CardItem(
//                   imagePath: "images/wind.png", label: "Wind", value: sunset)
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 80,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CardItem(
//                   imagePath: "images/pressure.png",
//                   label: "Pressure",
//                   value: pressure),
//               CardItem(imagePath: "images/humidity.png",
//                   label: "Humidity",
//                   value: humidity),
//               CardItem(imagePath: "images/info.png", label: "Info", value: info)
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return InkWell(
//       onTap: () {},
//       child: Container(
//         color: Constants.cardBackground,
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           // mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             //this should be the image asset with path covered with white tint, label(text), value(text)
//           ],
//         ),
//       ));
// }
