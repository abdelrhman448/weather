import 'package:dartz/dartz.dart';
import 'package:weather/core/network/failure_model.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByCountryName {
  final BaseWeatherRepository repository;

  GetWeatherByCountryName(this.repository);

  Future<Either<FailureModel,WeatherEntity>> execute(String cityName) async {
    return await repository.getWeatherByCityName(cityName);
  }
}
