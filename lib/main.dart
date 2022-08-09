import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/weather/domain/entities/weather.dart';

import 'weather/data/repository/weather_repository.dart';
import 'weather/data/source/remote.dart';
import 'weather/domain/repository/base_weather_repository.dart';
import 'weather/domain/usecases/get_weather_by_country.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BaseRemoteDataSource remoteDataSource = RemoteDataSource();
  BaseWeatherRepository weatherRepository = WeatherRepository(remoteDataSource);
  Weather weather = await GetWeatherByCountryName(weatherRepository).execute("Sanaa");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildThemeData,
      home: const Scaffold(),
    );
  }

  ThemeData get buildThemeData {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}
