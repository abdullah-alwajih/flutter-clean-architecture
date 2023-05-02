import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'genres.g.dart';

@HiveType(typeId: 2)
class Genres extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(2)
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
