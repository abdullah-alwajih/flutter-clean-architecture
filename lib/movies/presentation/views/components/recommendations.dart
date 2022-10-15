part of '../movie_detail.dart';

Widget showRecommendations() {
  return GetX<MovieDetailsController>(
    init: Get.find<MovieDetailsController>(),
    builder: (controller) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final recommendation =
                controller.recommendationsMovies.value.recommendations[index];
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: cachedNetworkImage(recommendation.backdropPath,
                      height: 170.0, width: 120.0)),
            );
          },
          childCount:
              controller.recommendationsMovies.value.recommendations.length,
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
