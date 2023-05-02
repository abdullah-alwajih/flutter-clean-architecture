part of '../movie_detail.dart';

Widget _buildRecommendationsGrid() {
  return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
    builder: (context, state) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (_, index) =>
                _buildRecommendationItem(state.recommendations[index]),
            childCount: state.recommendations.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      );
    },
  );
}
