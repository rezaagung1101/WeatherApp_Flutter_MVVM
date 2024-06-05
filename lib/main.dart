import 'package:flutter/material.dart';
import 'package:openweather_mvvm/view/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:openweather_mvvm/view_model/weather_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: WeatherViewModel())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            appBarTheme: AppBarTheme(),
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
            // useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
          },
        ));
  }
}
