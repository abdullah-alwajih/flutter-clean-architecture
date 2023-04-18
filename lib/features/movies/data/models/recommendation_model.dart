import '../../domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.id,
    required super.backdropPath,
  });

  factory RecommendationModel.fromMap(Map<String, dynamic> map) =>
      RecommendationModel(
        id: map['id'] ?? 0,
        backdropPath: map['backdrop_path'] ?? '',
      );
}
