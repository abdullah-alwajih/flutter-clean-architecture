part of '../movies.dart';

class PopularState extends StatelessWidget {
  const PopularState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PopularMoviesCubit>()..getPopularMoviesEvent(),
      child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          switch (state) {
            case PopularMoviesFailure():
              return buildError(message: state.message);
            case PopularMoviesSuccess():
              return buildMoviesList(state.popularMovies);
            default:
              return buildLoading(height: 170);
          }
        },
      ),
    );
  }
}
