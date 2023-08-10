part of '../movies.dart';

class TopRatedState extends StatelessWidget {
  const TopRatedState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TopRatedMoviesCubit>()..getTopRatedMoviesEvent(),
      child: BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
        builder: (context, state) {
          switch (state) {
            case TopRatedMoviesFailure():
              return buildError(message: state.message);
            case TopRatedMoviesSuccess():
              return buildMoviesList(state.topRatedMovies);
            default:
              return buildLoading(height: 170);
          }
        },
      ),
    );
  }
}
