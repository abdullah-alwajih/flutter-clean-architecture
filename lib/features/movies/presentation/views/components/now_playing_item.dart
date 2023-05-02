part of '../movies.dart';

Widget _buildNowPlayingItem(BuildContext context, Movie item) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, AppRoutes.movieDetails,
        arguments: item.id),
    child: Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // fromLTRB
                Colors.transparent, Colors.black, Colors.black,
                Colors.transparent,
              ],
              stops: [0, 0.3, 0.5, 1],
            ).createShader(
              Rect.fromLTRB(0, 0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: cachedNetworkImage(
            ApiUrls.imageUrl(item.backdropPath),
            height: 560.0,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.redAccent,
                    size: 16.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    AppLocalizations.of(context)!.nowPlaying.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(letterSpacing: 0),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    ),
  );
}
