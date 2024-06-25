import 'package:dartz/dartz.dart';
import 'package:weather/core/network/exceptions.dart';
import 'package:weather/core/network/failure_model.dart';
import 'package:weather/core/network/http_request_handler.dart';
import 'package:weather/core/utils/constants.dart';
import 'package:weather/core/utils/enums.dart';
import 'package:weather/weather/data/models/weather_model.dart';
import 'package:weather/weather/domain/entities/weather.dart';

abstract class BaseRemoteDataSource {
  Future<Either<FailureModel,WeatherEntity>> getWeatherByCountryName(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<Either<FailureModel,WeatherEntity>> getWeatherByCountryName(String countryName) async {
    try {
      final serverValue = await HttpHelper().callService(
        url: '${AppConstance.baseUrl}/weather?q=$countryName&appid=${AppConstance.appKey}',
        responseType: ResponseType.get,
      );
      print(serverValue);
      return Right(WeatherModel.fromJson(serverValue));
    } catch (e) {
      if(e is NotFoundException) {
        return Left(FailureModel(message: "not found city"));
      }
      else{
       return Left(FailureModel(message:e.toString()));
      }
    }
    }
}
