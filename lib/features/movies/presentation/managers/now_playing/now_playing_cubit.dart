import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/base/domain/entities/no_parameter.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_now_playing_movies.dart';

part 'now_playing_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  NowPlayingMoviesCubit(this.getNowPlayingMoviesUseCase)
      : super(NowPlayingMoviesInitial());

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    final result = await getNowPlayingMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(NowPlayingMoviesFailure(l.message)),
      (r) => emit(NowPlayingMoviesSuccess(r)),
    );
  }
}
