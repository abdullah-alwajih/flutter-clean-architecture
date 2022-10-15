import 'package:get/get.dart';

import '../../movies/data/repository/movies_repository.dart';
import '../../movies/data/source/remote.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_movies.dart';
import '../../movies/domain/usecases/get_popular_movies.dart';
import '../../movies/domain/usecases/get_recommendation_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies.dart';
import '../../movies/presentation/controllers/movie_details.dart';
import '../../movies/presentation/controllers/movies.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // DATE SOURCE
    Get.lazyPut<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

    /// Repository
    Get.lazyPut<BaseMoviesRepository>(
        () => MoviesRepository(Get.find<BaseMovieRemoteDataSource>()));
  }
}

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    /// Use Cases
    Get.lazyPut(
        () => GetNowPlayingMoviesUseCase(Get.find<BaseMoviesRepository>()));
    Get.lazyPut(
        () => GetPopularMoviesUseCase(Get.find<BaseMoviesRepository>()));
    Get.lazyPut(
        () => GetTopRatedMoviesUseCase(Get.find<BaseMoviesRepository>()));

    /// Controllers
    Get.lazyPut(() => MoviesController());
  }
}

class MoviesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    /// Use Cases
    Get.lazyPut(() => GetMovieDetailsUseCase(Get.find<BaseMoviesRepository>()));
    Get.lazyPut(
        () => GetRecommendationUseCase(Get.find<BaseMoviesRepository>()));

    /// Controllers
    Get.lazyPut(() => MovieDetailsController());
  }
}
