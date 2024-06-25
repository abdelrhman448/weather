import 'package:get_it/get_it.dart';
import 'package:weather/weather/data/datasource/remote_data_source.dart';
import 'package:weather/weather/data/repository/weather_repository.dart';
import 'package:weather/weather/domain/usecases/get_weather_by_country.dart';

final sl=GetIt.instance;

class ServiceLocator{
    init(){
      sl.registerLazySingleton(()=>RemoteDataSource());
      sl.registerLazySingleton(()=>WeatherRepository(sl<RemoteDataSource>()));
      sl.registerLazySingleton(()=>GetWeatherByCountryName(sl<WeatherRepository>()));
    }
}