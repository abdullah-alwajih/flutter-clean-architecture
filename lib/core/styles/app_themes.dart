part of '../../main.dart';

abstract class AppThemes {
  static ThemeData  get  darkTheme => ThemeData(
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline6:  TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
          subtitle2:  TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.2,
          ),
          caption: TextStyle(
            color: Colors.white70,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),

        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
      );
}
