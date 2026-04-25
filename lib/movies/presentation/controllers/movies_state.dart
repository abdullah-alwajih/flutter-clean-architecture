import 'package:equatable/equatable.dart';

import '../../../core/helpers/enums.dart';
import '../../domain/entities/movie.dart';

class NowPlayingMoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  const NowPlayingMoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  NowPlayingMoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
  }) =>
      NowPlayingMoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      );

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
      ];
}

class PopularMoviesState extends Equatable {
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  const PopularMoviesState({
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
  });

  PopularMoviesState copyWith({
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
  }) =>
      PopularMoviesState(
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
      );

  @override
  List<Object?> get props => [
        popularMovies,
        popularState,
        popularMessage,
      ];
}

class TopRatedMoviesState extends Equatable {
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const TopRatedMoviesState({
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  TopRatedMoviesState copyWith({
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) =>
      TopRatedMoviesState(
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      );

  @override
  List<Object?> get props => [
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}
