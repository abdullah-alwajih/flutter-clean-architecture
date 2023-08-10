import 'package:dartz/dartz.dart';

import '../../../../core/base/domain/entities/exceptions.dart';
import '../../../../core/base/domain/entities/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/repositories/base_movies.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_recommendation.dart';
import '../sources/local.dart';
import '../sources/remote.dart';

class MoviesRepository implements BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  final BaseMovieLocalDataSource baseMovieLocalDataSource;

  MoviesRepository(
    this.baseMovieRemoteDataSource,
    this.baseMovieLocalDataSource,
  );

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies(
      {int page = 1}) async {
    try {
      List<Movie> movies = [];
      // List<Movie> movies = baseMovieLocalDataSource.getNowPlayingMovies();
      // if(movies.isNotEmpty) return Right(movies);
      movies = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(movies);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies({int page = 1}) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getTopRatedMovies(page: page);
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getMovieDetails(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getRecommendations(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }
}
