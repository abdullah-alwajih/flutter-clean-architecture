import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/base/domain/entities/no_parameter.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_top_rated_movies.dart';

part 'top_rated_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.getTopRatedMoviesUseCase)
      : super(TopRatedMoviesInitial());

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  Future<void> getTopRatedMoviesEvent() async {
    emit(TopRatedMoviesLoading());
    final result = await getTopRatedMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(TopRatedMoviesFailure(l.message)),
      (r) => emit(TopRatedMoviesSuccess(r)),
    );
  }
}
