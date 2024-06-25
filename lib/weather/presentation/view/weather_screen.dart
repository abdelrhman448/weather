import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/extension/size_extention.dart';
import 'package:weather/core/helper/app_size_config_helper.dart';
import 'package:weather/core/utils/constants.dart';
import 'package:weather/weather/presentation/controller/weather_cubit.dart';
import 'package:weather/weather/presentation/controller/weather_states.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Timer? debounce;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(cityName: "cairo"),
      child: BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          WeatherCubit cubit= WeatherCubit.get(context);
          return  Scaffold(

              body:  Center(
                child: Container(
                  width: SizeConfig.width,
                  height: SizeConfig.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffBCE8FF),Color(0xffFFFFFF)]
                    )
                  ),

                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: SizeConfig.getHeight(60)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          onChanged: (value) {
                            if (debounce?.isActive ?? false) debounce?.cancel();
                            debounce = Timer(const Duration(milliseconds: 700), () {
                              cubit.getWeather(cityName: value.isNotEmpty?value:"cairo");
                            });
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter a location',
                            helperStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.all(10.0),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),

                        if(state is GetWeatherSuccessfulState)
                          Column(
                            children: [
                              Text(
                                cubit.weatherEntity?.name??"",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                              10.heightBox,
                              Image(
                                image: NetworkImage('${AppConstance.imageBaseUrl}${cubit.weatherEntity?.weather.first.icon}.png'),
                                height: SizeConfig.getHeight(50),
                                width:  SizeConfig.getHeight(50),

                              ),
                              10.heightBox,
                              Text(
                                '${cubit.weatherEntity?.main.temp.toString()}\u00B0'??"",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              10.heightBox,
                              Text(
                                cubit.weatherEntity?.weather.first.description??"",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),

                            ],
                          ),

                        if(state is GetWeatherLoadingState)
                          const Center(child: CircularProgressIndicator(color: Colors.blue,)),

                        if(state is GetWeatherErrorState)
                          Column(
                            children: [
                              Center(
                                child: Text(
                                    cubit.failure?.message??"",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )

                      ],
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}



