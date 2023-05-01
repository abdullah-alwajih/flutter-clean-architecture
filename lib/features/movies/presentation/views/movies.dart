import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/helpers/enums.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/network_image.dart';
import '../controllers/movies_bloc.dart';
import '../controllers/movies_event.dart';
import '../controllers/movies_state.dart';
import 'movie_detail.dart';

part 'components/now_playing.dart';

part 'components/popular.dart';

part 'components/section_tile.dart';

part 'components/top_rated.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              buildSectionTile(
                context,
                text: AppLocalizations.of(context)!.popular,
                onTap: () {
                  /// TODO : NAVIGATION TO POPULAR SCREEN
                },
              ),
              const PopularComponent(),
              buildSectionTile(
                context,
                text: AppLocalizations.of(context)!.topRated,
                onTap: () {
                  /// TODO : NAVIGATION TO POPULAR SCREEN
                },
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
