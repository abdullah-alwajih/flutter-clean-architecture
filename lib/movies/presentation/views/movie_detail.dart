import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/helpers/app_helpers.dart';
import '../../../core/helpers/enums.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/network_image.dart';
import '../controllers/movie_details_bloc.dart';

part 'components/recommendations.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  key: const Key('movieDetailScrollView'),
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
                              ApiConstants.imageUrl(
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
                              Text(state.movieDetails!.title,
                                  style: GoogleFonts.poppins(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  )),
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
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        '(${state.movieDetails!.voteAverage})',
                                        style: const TextStyle(
                                          fontSize: 1.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16.0),
                                  Text(
                                    AppHelpers.showDuration(
                                        state.movieDetails!.runTime),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                state.movieDetails!.overview,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Genres: ${AppHelpers.showGenres(state.movieDetails!.genres)}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
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
                            'More like this'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
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
