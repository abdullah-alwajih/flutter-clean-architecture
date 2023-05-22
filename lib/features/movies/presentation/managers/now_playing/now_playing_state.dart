part of 'now_playing_cubit.dart';

abstract class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState();
}

class NowPlayingMoviesInitial extends NowPlayingMoviesState {
  @override
  List<Object> get props => [];
}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {
  @override
  List<Object> get props => [];
}

class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String message;

  const NowPlayingMoviesFailure(this.message);

  @override
  List<Object> get props => [message];
}

class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<Movie> nowPlayingMovies;

  const NowPlayingMoviesSuccess(this.nowPlayingMovies);

  @override
  List<Object> get props => [nowPlayingMovies];
}
