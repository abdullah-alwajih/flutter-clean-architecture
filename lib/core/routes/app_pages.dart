import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/routes/app_routes.dart';

import '../../features/movies/presentation/views/movie_detail.dart';
import '../../features/movies/presentation/views/movies.dart';

abstract class AppPages {
  static const String initial = AppRoutes.layout;

  static Map<String, Widget Function(BuildContext)> pages = {
    initial: (context) => const MoviesView(),
    AppRoutes.movieDetails: (context) => const MovieDetailView(),
  };
}
