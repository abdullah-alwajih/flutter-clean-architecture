import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/base/data/source/api_constants.dart';
import '../../../../core/components/error.dart';
import '../../../../core/components/loading.dart';
import '../../../../core/helpers/app_helpers.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/network_image.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../managers/movie_details/movie_details_cubit.dart';
import '../managers/recommendation/recommendation_cubit.dart';

part 'components/recommendation_item.dart';
part 'components/recommendations_grid.dart';
part 'components/sliver_app_bar.dart';
part 'components/sliver_to_box_adapter.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int id =
        int.tryParse('${ModalRoute.of(context)?.settings.arguments}') ?? 0;

    return BlocProvider(
      create: (context) => sl<MovieDetailsCubit>()
        ..getMovieDetails(MovieDetailsParameters(id: id)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            switch (state) {
              case MovieDetailsFailure():
                return buildError(message: state.message);
              case MovieDetailsSuccess():
                return CustomScrollView(
                  slivers: [
                    buildSliverAppBar(context, state.movieDetails),
                    buildSliverToBoxAdapter(context, state.movieDetails),
                    SliverPadding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                      sliver: SliverToBoxAdapter(
                        child: FadeInUp(
                          from: 20,
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            AppLocalizations.of(context)!
                                .moreLikeThis
                                .toUpperCase(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                    // Tab(text: 'More like this'.toUpperCase()),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                      sliver: _buildRecommendationsGrid(id),
                    ),
                  ],
                );
              default:
                return buildLoading(height: 250);
            }
          },
        ),
      ),
    );
  }
}
