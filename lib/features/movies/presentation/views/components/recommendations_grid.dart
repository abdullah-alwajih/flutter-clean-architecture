part of '../movie_detail.dart';

Widget _buildRecommendationsGrid(int id) {
  return BlocProvider(
    create: (context) => sl<RecommendationCubit>()
      ..getRecommendation(MovieDetailsParameters(id: id)),
    child: BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        switch (state) {
          case RecommendationFailure():
            return SliverToBoxAdapter(
                child: buildError(message: state.message));
          case RecommendationSuccess():
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (_, index) =>
                    _buildRecommendationItem(state.recommendations[index]),
                childCount: state.recommendations.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            );

          default:
            return SliverToBoxAdapter(child: buildLoading(height: 170));
        }
      },
    ),
  );
}
