abstract class WeatherStates{}

class InitialWeatherState extends WeatherStates{}
class GetWeatherLoadingState extends WeatherStates{}
class GetWeatherSuccessfulState extends WeatherStates{}
class GetWeatherErrorState extends WeatherStates{}