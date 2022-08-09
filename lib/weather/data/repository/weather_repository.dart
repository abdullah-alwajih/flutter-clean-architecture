import 'package:flutter_clean_architecture/weather/data/source/remote.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepository(this.remoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    try {
      return await remoteDataSource.getWeatherByCityName(cityName);
    } catch (_) {
      rethrow;
    }
  }
}
