part of 'recommendation_cubit.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();
}

class RecommendationInitial extends RecommendationState {
  @override
  List<Object> get props => [];
}

class RecommendationLoading extends RecommendationState {
  @override
  List<Object> get props => [];
}

class RecommendationFailure extends RecommendationState {
  final String message;

  const RecommendationFailure(this.message);

  @override
  List<Object> get props => [message];
}

class RecommendationSuccess extends RecommendationState {
  final List<Recommendation> recommendations;

  const RecommendationSuccess(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}
