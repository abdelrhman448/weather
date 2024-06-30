import 'package:weather/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity{
  WeatherModel({
    required List<Weather> weather,
    required Main main,
    required int timezone,
    required String name,
  }) : super(
    weather: weather,
    main: main,
    timezone: timezone,
    name: name,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    main: Main.fromJson(json["main"]),
    timezone: json["timezone"],
    name: json["name"],
  );


}








