part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsFailure extends MovieDetailsState {
  final String message;

  const MovieDetailsFailure(this.message);

  @override
  List<Object> get props => [message];
}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetails movieDetails;

  const MovieDetailsSuccess(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}
