import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies App',
      theme: buildThemeData,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
    );
  }

  ThemeData get buildThemeData => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      );
}
