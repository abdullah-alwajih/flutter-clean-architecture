import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
        id: map['id'],
        title: map['title'],
        backdropPath: map['backdrop_path'],
        genreIds: List<int>.from(map['genre_ids']).map((e) => e).toList(),
        overview: map['overview'],

        /// TODO : CHECK THIS
        voteAverage: map['vote_average'],
        releaseDate: map[' release_date'],
      );

  Map<String, dynamic> toMap() => {};
}
