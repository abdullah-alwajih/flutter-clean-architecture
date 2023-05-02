import '../../../../core/base/data/models/error_message.dart';
import '../../../../core/base/data/source/api_constants.dart';
import '../../../../core/base/data/source/remote.dart';
import '../../../../core/base/domain/entities/exceptions.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_recommendation.dart';
import '../models/movie.dart';
import '../models/movie_details.dart';
import '../models/recommendation.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  final Remote remote;

  const MovieRemoteDataSource(this.remote);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await remote.get(ApiUrls.nowPlayingPath);
      if (response.statusCode == 200) {
        List<MovieModel> movies =
            MovieModel.fromMapList(response.data['results'] as List);
        return movies;
      } else {
        throw ServerException(ErrorMessageModel.fromMap(response.data));
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await remote.get(ApiUrls.popularPath);
      if (response.statusCode == 200) {
        return MovieModel.fromMapList(response.data['results'] as List);
      } else {
        throw ServerException(ErrorMessageModel.fromMap(response.data));
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await remote.get(ApiUrls.topRatedPath);
      if (response.statusCode == 200) {
        return MovieModel.fromMapList(response.data['results'] as List);
      } else {
        throw ServerException(ErrorMessageModel.fromMap(response.data));
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      final response =
          await remote.get(ApiUrls.movieDetailsPath(parameters.movieID));
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromMap(response.data);
      } else {
        throw ServerException(ErrorMessageModel.fromMap(response.data));
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters parameters) async {
    try {
      final response =
          await remote.get(ApiUrls.recommendationsPath(parameters.id));
      if (response.statusCode == 200) {
        return RecommendationModel.fromMapList(
            response.data['results'] as List);
      } else {
        throw ServerException(ErrorMessageModel.fromMap(response.data));
      }
    } catch (_) {
      rethrow;
    }
  }
}
