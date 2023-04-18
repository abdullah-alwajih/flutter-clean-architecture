import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/error_message.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';
import '../models/movie_details.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendations(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await Dio().get(ApiConstants.nowPlayingPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromMap(e)),
        );
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
      final response = await Dio().get(ApiConstants.popularPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromMap(e)),
        );
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
      final response = await Dio().get(ApiConstants.topRatedPath);
      if (response.statusCode == 200) {
        return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromMap(e)),
        );
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
          await Dio().get(ApiConstants.movieDetailsPath(parameters.movieID));
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
          await Dio().get(ApiConstants.recommendationsPath(parameters.id));
      if (response.statusCode == 200) {
        return List<RecommendationModel>.from(
          (response.data['results'] as List)
              .map((e) => RecommendationModel.fromMap(e)),
        );
      } else {
        throw ServerException(ErrorMessageModel.fromMap(response.data));
      }
    } catch (_) {
      rethrow;
    }
  }
}
