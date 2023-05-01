import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int runTime;
  final List<Genres> genres;

  const MovieDetails({
    this.id = 0,
    this.backdropPath = '',
    this.overview = '',
    this.releaseDate = '',
    this.runTime = 0,
    this.title = '',
    this.voteAverage = 0.0,
    this.genres = const [],
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage,
        genres,
      ];
}
