import 'package:flutter/material.dart';
import 'package:openweather_mvvm/utils/constants.dart';
import 'package:openweather_mvvm/utils/preference_util.dart';
import 'package:openweather_mvvm/view/screens/home_screen.dart';
import 'package:openweather_mvvm/view/screens/list_city_screen.dart';
import 'package:openweather_mvvm/view/screens/splash_screen.dart';
import 'package:openweather_mvvm/view_model/weather_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializePreference();
  //or it can be directly with -> await PreferenceUtil.init();
  runApp(const MyApp());
}

Future<void> initializePreference() async {
  await PreferenceUtil.init();
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
            // appBarTheme: AppBarTheme(),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Constants.skyBlue,
            // useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
            '/list-city': (context) => ListCityScreen()
          },
        ));
  }
}
