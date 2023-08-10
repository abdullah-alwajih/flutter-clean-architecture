import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_details.dart';
import '../../../domain/usecases/get_movie_details.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsCubit(this.getMovieDetailsUseCase) : super(MovieDetailsInitial());

  Future<void> getMovieDetails(parameters) async {
    emit(MovieDetailsLoading());
    final result = await getMovieDetailsUseCase(parameters);
    result.fold(
      (l) => emit(MovieDetailsFailure(l.message)),
      (r) => emit(MovieDetailsSuccess(r)),
    );
  }
}
