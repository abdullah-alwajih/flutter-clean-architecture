import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.id,
    required super.cityName,
    required super.main,
    required super.description,
    required super.pressure,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> object) => WeatherModel(
        id: object['id'],
        cityName: object['name'],
        main: object['weather'][0]['main'],
        description: object['weather'][0]['description'],
        pressure: object['main']['pressure'],
      );
}
