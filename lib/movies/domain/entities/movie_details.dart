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
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
    required this.genres,
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
