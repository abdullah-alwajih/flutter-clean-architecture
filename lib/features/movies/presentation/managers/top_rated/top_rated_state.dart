part of 'top_rated_cubit.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();
}

class TopRatedMoviesInitial extends TopRatedMoviesState {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesLoading extends TopRatedMoviesState {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String message;

  const TopRatedMoviesFailure(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final List<Movie> topRatedMovies;

  const TopRatedMoviesSuccess(this.topRatedMovies);

  @override
  List<Object> get props => [topRatedMovies];
}
