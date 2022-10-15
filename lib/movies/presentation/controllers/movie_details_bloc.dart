import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/enums.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(event, emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieID: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(movieDetailsState: RequestState.loaded, movieDetails: r),
      ),
    );
  }

  FutureOr<void> _getRecommendation(event, emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
            recommendationsState: RequestState.error,
            recommendationsMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
            recommendationsState: RequestState.loaded, recommendations: r),
      ),
    );
  }
}
