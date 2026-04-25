import 'package:get/get.dart';

import '../../movies/presentation/views/movie_detail.dart';
import '../../movies/presentation/views/movies.dart';
import 'app_bindings.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRoutes.movies;
  static final pages = [
    GetPage(
      name: AppRoutes.movies,
      page: () => const MoviesView(),
      bindings: [
        SplashBinding(),
        MoviesBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.moviesDetails,
      page: () => const MovieDetailView(),
      bindings: [
        SplashBinding(),
        MoviesDetailsBinding(),
      ],
    ),
  ];
}
