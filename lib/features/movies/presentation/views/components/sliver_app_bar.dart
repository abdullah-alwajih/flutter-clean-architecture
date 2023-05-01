part of '../movie_detail.dart';

SliverAppBar buildSliverAppBar(BuildContext context, MovieDetails movieDetails,) {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 250.0,
    flexibleSpace: FlexibleSpaceBar(
      background: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0.0, 0.5, 1.0, 1.0],
            ).createShader(
              Rect.fromLTRB(
                  0.0, 0.0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: cachedNetworkImage(
            ApiUrls.imageUrl(
                movieDetails.backdropPath),
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    ),
  );
}
