import 'package:hive_flutter/hive_flutter.dart';

import '../../features/movies/domain/entities/genres.dart';
import '../../features/movies/domain/entities/movie.dart';
import '../../features/movies/domain/entities/movie_details.dart';
import '../../features/movies/domain/entities/recommendation.dart';

abstract class RegisterAdapters {
  static void init() async {
    await Hive.initFlutter();
    Hive
      // ..init((await getApplicationDocumentsDirectory()).path)
      ..registerAdapter(MovieAdapter())
      ..registerAdapter(RecommendationAdapter())
      ..registerAdapter(GenresAdapter())
      ..registerAdapter(MovieDetailsAdapter());
  }
}
