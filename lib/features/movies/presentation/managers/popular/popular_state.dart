part of 'popular_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();
}

class PopularMoviesInitial extends PopularMoviesState {
  @override
  List<Object> get props => [];
}

class PopularMoviesLoading extends PopularMoviesState {
  @override
  List<Object> get props => [];
}

class PopularMoviesFailure extends PopularMoviesState {
  final String message;

  const PopularMoviesFailure(this.message);

  @override
  List<Object> get props => [message];
}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<Movie> popularMovies;

  const PopularMoviesSuccess(this.popularMovies);

  @override
  List<Object> get props => [popularMovies];
}
