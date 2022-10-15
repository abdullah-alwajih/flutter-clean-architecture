import 'dart:async';

import 'package:get/get.dart';

import '../../../core/usecase/base_use_case.dart';
import '../../../core/helpers/enums.dart';
import '../../domain/usecases/get_now_playing_movies.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import 'movies_state.dart';

class MoviesController extends GetxController {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase = Get.find();
  final GetPopularMoviesUseCase getPopularMoviesUseCase = Get.find();
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase = Get.find();

  Rx<NowPlayingMoviesState> nowPlaying =
      Rx<NowPlayingMoviesState>(const NowPlayingMoviesState());
  Rx<PopularMoviesState> popular =
      Rx<PopularMoviesState>(const PopularMoviesState());
  Rx<TopRatedMoviesState> topRated =
      Rx<TopRatedMoviesState>(const TopRatedMoviesState());

  @override
  void onReady() async {
    super.onReady();
    await _getNowPlayingMoviesEvent();
    await _getPopularMoviesEvent();
    await _getTopRatedMoviesEvent();
  }

  FutureOr<void> _getNowPlayingMoviesEvent() async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => nowPlaying.value = nowPlaying.value.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: l.message,
      ),
      (r) => nowPlaying.value = nowPlaying.value.copyWith(
        nowPlayingState: RequestState.loaded,
        nowPlayingMovies: r,
      ),
    );
  }

  FutureOr<void> _getPopularMoviesEvent() async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (l) => popular.value = popular.value.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      ),
      (r) => popular.value = popular.value.copyWith(
        popularState: RequestState.loaded,
        popularMovies: r,
      ),
    );
  }

  FutureOr<void> _getTopRatedMoviesEvent() async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (l) => topRated.value = topRated.value.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: l.message,
      ),
      (r) => topRated.value = topRated.value.copyWith(
        topRatedState: RequestState.loaded,
        topRatedMovies: r,
      ),
    );
  }
}
