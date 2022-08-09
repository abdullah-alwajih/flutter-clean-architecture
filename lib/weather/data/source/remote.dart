import 'package:dio/dio.dart';

import '../../../core/helpers/constants.dart';
import '../models/weather.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getWeatherByCityName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    try {
      var response = await Dio().get(
          '${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.apiKey}');
      return WeatherModel.fromMap(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
