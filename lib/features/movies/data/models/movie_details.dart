import '../../domain/entities/movie_details.dart';
import 'genres.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) =>
      MovieDetailsModel(
        id: map['id'] ?? 0,
        title: map['title'] ?? '',
        overview: map['overview'] ?? '',
        backdropPath: map['backdrop_path'] ?? '',
        releaseDate: map['release_date'] ?? '',
        voteAverage: map['vote_average'].toDouble() ?? 0.0,
        runTime: map['runtime'] ?? 0,
        genres: List<GenresModel>.from(
            map['genres'].map((e) => GenresModel.fromMap(e))),
      );
}
