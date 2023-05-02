part of '../movies.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return buildLoading(height: 400);
          case RequestState.error:
            return buildError(message: state.nowPlayingMessage);
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                ),
                items: state.nowPlayingMovies
                    .map((item) => _buildNowPlayingItem(context, item))
                    .toList(),
              ),
            );
        }
      },
    );
  }
}
