import '../../domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromMap(Map<String, dynamic> map) => GenresModel(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
      );
}
