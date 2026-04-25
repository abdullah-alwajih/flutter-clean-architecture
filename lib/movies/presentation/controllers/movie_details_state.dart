import 'package:equatable/equatable.dart';

import '../../../core/helpers/enums.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendations,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      );

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
      ];
}

class RecommendationsMoviesState extends Equatable {
  final List<Recommendation> recommendations;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  const RecommendationsMoviesState({
    this.recommendations = const [],
    this.recommendationsState = RequestState.loading,
    this.recommendationsMessage = '',
  });

  RecommendationsMoviesState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendations,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) =>
      RecommendationsMoviesState(
        recommendations: recommendations ?? this.recommendations,
        recommendationsState: recommendationsState ?? this.recommendationsState,
        recommendationsMessage:
            recommendationsMessage ?? this.recommendationsMessage,
      );

  @override
  List<Object?> get props => [
        recommendations,
        recommendationsState,
        recommendationsMessage,
      ];
}
