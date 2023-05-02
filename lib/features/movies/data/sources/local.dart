import 'package:hive/hive.dart';

import '../../../../core/base/data/source/app_box.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_recommendation.dart';

abstract class BaseMovieLocalDataSource {
  List<Movie> getNowPlayingMovies();

  List<Movie> getPopularMovies();

  List<Movie> getTopRatedMovies();

  MovieDetails getMovieDetails(MovieDetailsParameters parameters);

  List<Recommendation> getRecommendations(RecommendationParameters parameters);
}

class MovieLocalDataSource implements BaseMovieLocalDataSource {
  @override
  MovieDetails getMovieDetails(MovieDetailsParameters parameters) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  List<Movie> getNowPlayingMovies() =>
      Hive.box<Movie>(AppBox.kNowPlayingMovies).values.toList();

  @override
  List<Movie> getPopularMovies() =>
      Hive.box<Movie>(AppBox.kPopularMovies).values.toList();

  @override
  List<Recommendation> getRecommendations(RecommendationParameters parameters) {
    // TODO: implement getRecommendations
    throw UnimplementedError();
  }

  @override
  List<Movie> getTopRatedMovies() =>
      Hive.box<Movie>(AppBox.kTopRatedMovies).values.toList();
}
