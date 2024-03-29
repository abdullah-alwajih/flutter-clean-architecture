import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/base/domain/entities/failure.dart';
import '../../../../core/base/domain/usecase/base_use_case.dart';
import '../entities/recommendation.dart';
import '../repositories/base_movies.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    // here can check permission
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
