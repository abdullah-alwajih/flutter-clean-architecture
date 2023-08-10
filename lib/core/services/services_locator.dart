import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/movies/presentation/managers/movie_details/movie_details_cubit.dart';
import 'package:flutter_clean_architecture/features/movies/presentation/managers/now_playing/now_playing_cubit.dart';
import 'package:flutter_clean_architecture/features/movies/presentation/managers/popular/popular_cubit.dart';
import 'package:flutter_clean_architecture/features/movies/presentation/managers/recommendation/recommendation_cubit.dart';
import 'package:flutter_clean_architecture/features/movies/presentation/managers/top_rated/top_rated_cubit.dart';
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
import '../base/data/source/remote.dart';

final sl = GetIt.instance;

abstract class ServicesLocator {
  static void init() {
    /// Bloc
    sl.registerFactory(() => MovieDetailsCubit(sl()));
    sl.registerFactory(() => RecommendationCubit(sl()));
    sl.registerFactory(() => NowPlayingMoviesCubit(sl()));
    sl.registerFactory(() => TopRatedMoviesCubit(sl()));
    sl.registerFactory(() => PopularMoviesCubit(sl()));
    // sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

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
