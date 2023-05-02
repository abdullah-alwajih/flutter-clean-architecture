import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'genres.dart';

part 'movie_details.g.dart';

@HiveType(typeId: 3)
class MovieDetails extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String backdropPath;
  @HiveField(4)
  final String releaseDate;
  @HiveField(5)
  final double voteAverage;
  @HiveField(6)
  final int runTime;
  @HiveField(7)
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
