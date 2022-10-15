import 'package:flutter/material.dart';

import 'core/services/services_locator.dart';
import 'movies/presentation/views/movies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: buildThemeData,
      home: const MoviesScreen(),
    );
  }

  ThemeData get buildThemeData => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey.shade900,
  );
}
