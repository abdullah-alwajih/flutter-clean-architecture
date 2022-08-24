import 'package:flutter_clean_architecture/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_clean_architecture/movies/domain/usecases/get_popular_movies.dart';
import 'package:flutter_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:flutter_clean_architecture/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_clean_architecture/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movies/data/repository/movies_repository.dart';
import '../../movies/data/source/remote.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_now_playing_movies.dart';
import '../../movies/presentation/controllers/movies_bloc.dart';

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
        () => MoviesRepository(sl()));

    /// DATE SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
