import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/movies/data/repositories/movies.dart';
import '../../features/movies/data/sources/local.dart';
import '../../features/movies/data/sources/remote.dart';
import '../../features/movies/domain/repositories/base_movies.dart';
import '../../features/movies/domain/usecases/get_movie_details.dart';
import '../../features/movies/domain/usecases/get_now_playing_movies.dart';
import '../../features/movies/domain/usecases/get_popular_movies.dart';
import '../../features/movies/domain/usecases/get_recommendation.dart';
import '../../features/movies/domain/usecases/get_top_rated_movies.dart';
import '../../features/movies/presentation/controllers/movie_details_bloc.dart';
import '../../features/movies/presentation/controllers/movies_bloc.dart';
import '../base/data/source/remote.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl(), sl()));

    /// DATE SOURCE
    sl.registerFactory(() => Remote(Dio()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource(sl()));
    sl.registerLazySingleton<BaseMovieLocalDataSource>(
        () => MovieLocalDataSource());
  }
}
