import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/network/failure_model.dart';
import 'package:weather/core/service_locator/get_it_service.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/usecases/get_weather_by_country.dart';
import 'package:weather/weather/presentation/controller/weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherEntity? weatherEntity;
  FailureModel? failure;

  WeatherCubit():super(InitialWeatherState());

  static WeatherCubit get(context)=>BlocProvider.of(context);

  getWeather({required String cityName})async{
    emit(GetWeatherLoadingState());
    await sl<GetWeatherByCountryName>.call().execute(cityName).then((value) {
      print(value);
      value.fold(
              (l) {
                failure=l;
                emit(GetWeatherErrorState());
              } ,
              (r) {

                weatherEntity=r;
                emit(GetWeatherSuccessfulState());
              }
      );
   }).catchError((e){
     emit(GetWeatherErrorState());
   });
  }

}