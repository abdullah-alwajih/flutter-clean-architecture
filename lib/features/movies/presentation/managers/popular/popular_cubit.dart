import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/movies/domain/usecases/get_popular_movies.dart';

import '../../../../../core/base/domain/entities/no_parameter.dart';
import '../../../domain/entities/movie.dart';

part 'popular_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitial());

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  Future<void> getPopularMoviesEvent() async {
    emit(PopularMoviesLoading());
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(PopularMoviesFailure(l.message)),
      (r) => emit(PopularMoviesSuccess(r)),
    );
  }
}
