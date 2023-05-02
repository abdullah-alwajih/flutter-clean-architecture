part of '../movie_detail.dart';

Widget _buildRecommendationItem(Recommendation recommendation) {
  return FadeInUp(
    from: 20,
    duration: const Duration(milliseconds: 500),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      child: cachedNetworkImage(recommendation.backdropPath,
          height: 170.0, width: 120.0),
    ),
  );
}
