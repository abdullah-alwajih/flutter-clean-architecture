part of '../movie_detail.dart';

Widget _showRecommendations() {
  return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
    builder: (context, state) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final recommendation = state.recommendations[index];
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: cachedNetworkImage(recommendation.backdropPath,
                      height: 170.0, width: 120.0)),
            );
          },
          childCount: state.recommendations.length,
        ),
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
