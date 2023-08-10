import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/error.dart';
import '../../../../../core/components/loading.dart';
import '../../../../../core/services/services_locator.dart';
import '../../managers/now_playing/now_playing_cubit.dart';
import '../movies.dart';

class NowPlayingState extends StatelessWidget {
  const NowPlayingState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NowPlayingMoviesCubit>()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
        builder: (context, state) {
          switch (state) {
            case NowPlayingMoviesFailure():
              return buildError(message: state.message);
            case NowPlayingMoviesSuccess():
              return NowPlayingList(nowPlayingMovies: state.nowPlayingMovies);
            default:
              return buildLoading(height: 400);
          }
        },
      ),
    );
  }
}
