import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/base/domain/entities/failure.dart';
import '../../../domain/entities/recommendation.dart';
import '../../../domain/usecases/get_recommendation.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final GetRecommendationUseCase getRecommendationUseCase;

  RecommendationCubit(this.getRecommendationUseCase)
      : super(RecommendationInitial());

  Future<void> getRecommendation(event) async {
    emit(RecommendationLoading());
    final Either<Failure, List<Recommendation>> result =
        await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
      (failure) => emit(RecommendationFailure(failure.message)),
      (recommendations) => emit(RecommendationSuccess(recommendations)),
    );
  }
}
