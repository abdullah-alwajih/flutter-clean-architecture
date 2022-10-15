import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';

import '../../../core/usecase/base_use_case.dart';
import '../entities/recommendation.dart';
import '../repository/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters)async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int movieID;

  const RecommendationParameters({
    required this.movieID,
  });

  @override
  List<Object> get props => [id];
}
