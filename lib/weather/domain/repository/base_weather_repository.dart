import 'package:dartz/dartz.dart';
import 'package:weather/core/network/failure_model.dart';
import 'package:weather/weather/domain/entities/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<FailureModel,WeatherEntity>> getWeatherByCityName(String cityName);
}
