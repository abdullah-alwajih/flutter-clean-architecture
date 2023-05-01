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
              return buildMoviesList(state.topRatedMovies);
          }
        },
      );
}
