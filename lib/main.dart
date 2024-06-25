import 'package:flutter/material.dart';
import 'package:weather/core/service_locator/get_it_service.dart';
import 'package:weather/weather/data/datasource/remote_data_source.dart';
import 'package:weather/weather/data/repository/weather_repository.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/weather/presentation/view/weather_screen.dart';

import 'weather/domain/usecases/get_weather_by_country.dart';
GlobalKey<NavigatorState> weatherNavigatorKey = GlobalKey<NavigatorState>();

void main() async {

  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: weatherNavigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen()
    );
  }
}


