import 'package:flutter_clean_architecture/weather/data/source/remote.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String cityName) async {
    try {
      return await baseRemoteDataSource.getWeatherByCityName(cityName);
    } catch (_) {
      rethrow;
    }
  }
}
