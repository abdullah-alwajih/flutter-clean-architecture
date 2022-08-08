import '../entities/weather.dart';
import '../repository/weather_repository.dart';

class GetWeatherByCountryName {
  final WeatherRepository repository;

  GetWeatherByCountryName(this.repository);

  Future<Weather> execute(String cityName) async {
    return await repository.getWeatherByCityName(cityName);
  }
}
