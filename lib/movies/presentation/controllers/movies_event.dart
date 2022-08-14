
import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class GetNowPlayingMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class GetPopularMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}
