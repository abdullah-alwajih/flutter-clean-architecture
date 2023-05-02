import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_recommendation.dart';
import '../models/movie.dart';
import '../models/movie_details.dart';
import '../models/recommendation.dart';

abstract class BaseMovieLocalDataSource {
  List<MovieModel> getNowPlayingMovies();

  List<MovieModel> getPopularMovies();

  List<MovieModel> getTopRatedMovies();

  MovieDetailsModel getMovieDetails(MovieDetailsParameters parameters);

  List<RecommendationModel> getRecommendations(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource implements BaseMovieLocalDataSource {
  @override
  MovieDetailsModel getMovieDetails(MovieDetailsParameters parameters) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  List<MovieModel> getNowPlayingMovies() {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  List<MovieModel> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  List<RecommendationModel> getRecommendations(RecommendationParameters parameters) {
    // TODO: implement getRecommendations
    throw UnimplementedError();
  }

  @override
  List<MovieModel> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }


}