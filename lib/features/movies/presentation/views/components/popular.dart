part of '../movies.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return buildLoading(height: 170);
          case RequestState.error:
            return buildError(message: state.nowPlayingMessage);
          case RequestState.loaded:
            return buildMoviesList(state.popularMovies);
        }
      },
    );
  }
}
