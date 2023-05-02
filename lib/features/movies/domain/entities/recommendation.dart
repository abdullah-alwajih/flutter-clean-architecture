import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'recommendation.g.dart';

@HiveType(typeId: 1)
class Recommendation extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String backdropPath;

  const Recommendation({
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object> get props => [id, backdropPath];
}
