import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/helpers/app_helpers.dart';
import '../../../../core/helpers/enums.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/network_image.dart';
import '../controllers/movie_details_bloc.dart';

part 'components/recommendations.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int id =
        int.tryParse('${ModalRoute.of(context)?.settings.arguments}') ?? 0;

    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id: id))
        ..add(GetMovieRecommendationEvent(id: id)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.movieDetailsState) {
              case RequestState.loading:
                return const SizedBox(
                    height: 400.0,
                    child: Center(child: CircularProgressIndicator()));
              case RequestState.loaded:
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0.0, 0.5, 1.0, 1.0],
                              ).createShader(
                                Rect.fromLTRB(
                                    0.0, 0.0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: cachedNetworkImage(
                              ApiUrls.imageUrl(
                                  state.movieDetails!.backdropPath),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.movieDetails!.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      state.movieDetails!.releaseDate
                                          .split('-')[0],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        (state.movieDetails!.voteAverage / 2)
                                            .toStringAsFixed(1),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        '(${state.movieDetails!.voteAverage})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16.0),
                                  Text(
                                    AppHelpers.showDuration(
                                        state.movieDetails!.runTime),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                state.movieDetails!.overview,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '${AppLocalizations.of(context)!.genres}: ${AppHelpers.showGenres(state.movieDetails!.genres)}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                      sliver: _showRecommendations(),
                    ),
                  ],
                );
              case RequestState.error:
                return SizedBox(
                    height: 400.0,
                    child: Center(child: Text(state.movieDetailsMessage)));
            }
          },
        ),
      ),
    );
  }
}
