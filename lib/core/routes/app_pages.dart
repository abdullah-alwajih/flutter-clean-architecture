import 'package:flutter/material.dart';

import '../../features/movies/presentation/views/movie_detail.dart';
import '../../features/movies/presentation/views/movies.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const String initial = AppRoutes.layout;

  static Map<String, Widget Function(BuildContext)> pages = {
    initial: (context) => const MoviesView(),
    AppRoutes.movieDetails: (context) => const MovieDetailView(),
  };
}
