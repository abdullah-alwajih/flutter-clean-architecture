import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/l10n/app_localizations.dart';

import 'core/routes/app_pages.dart';
import 'core/services/services_locator.dart';

part 'core/styles/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      initialRoute: AppPages.initial,
      routes: AppPages.pages,
    );
  }
}
