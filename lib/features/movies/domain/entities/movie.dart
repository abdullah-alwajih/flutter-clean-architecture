import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String backdropPath;
  @HiveField(3)
  final List<int> genreIds;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final double voteAverage;
  @HiveField(6)
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
      ];
}
