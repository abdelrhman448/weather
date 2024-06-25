import 'package:weather/weather/data/models/weather_model.dart';

class WeatherEntity {
  final List<Weather> weather;
  final Main main;
  final int timezone;
  final String name;

  WeatherEntity({
    required this.weather,
    required this.main,
    required this.timezone,
    required this.name,
  });
}
class Main {
  final int temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;


  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].round()-273,
    feelsLike: json["feels_like"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),

  );


}



class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );


}