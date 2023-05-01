part of '../movies.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.topRatedState != current.topRatedState,
        builder: (context, state) {
          switch (state.topRatedState) {
            case RequestState.loading:
              return buildLoading(height: 170);
            case RequestState.error:
              return buildError(message: state.nowPlayingMessage);
            case RequestState.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.topRatedMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.topRatedMovies[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.movieDetails,
                              arguments: movie.id),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: cachedNetworkImage(
                              ApiUrls.imageUrl(movie.backdropPath),
                              width: 120.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
          }
        },
      );
}
