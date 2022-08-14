abstract class ApiConstants {
  static const String apiKey = '?api_key=f6b41413ca9f340278fc896f747e31e8';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String moviePath = '${baseUrl}movie/';
  static const String nowPlayingPath = '${moviePath}now_playing$apiKey';
  static const String popularPath = '${moviePath}popular$apiKey';
  static const String topRatedPath = '${moviePath}top_rated$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String pathImage) => '$baseImageUrl$pathImage';
}
