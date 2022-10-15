// import 'dart:async';
//
import 'dart:async';

import 'package:get/get.dart';

import '../../../core/helpers/enums.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';
import 'movie_details_state.dart';

class MovieDetailsController extends GetxController {
  late GetMovieDetailsUseCase getMovieDetailsUseCase = Get.find();
  late GetRecommendationUseCase getRecommendationUseCase = Get.find();

  Rx<MovieDetailsState> movieDetails =
      Rx<MovieDetailsState>(const MovieDetailsState());
  Rx<RecommendationsMoviesState> recommendationsMovies =
      Rx<RecommendationsMoviesState>(const RecommendationsMoviesState());

  @override
  void onReady() async {
    super.onReady();
    final movieID = Get.arguments;
    await _getMovieDetails(movieID);
    await _getRecommendation(movieID);
  }

  FutureOr<void> _getMovieDetails(movieID) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieID: movieID));
    result.fold(
      (l) => movieDetails.value = movieDetails.value.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message),
      (r) => movieDetails.value = movieDetails.value
          .copyWith(movieDetailsState: RequestState.loaded, movieDetails: r),
    );
  }

  FutureOr<void> _getRecommendation(movieID) async {
    final result = await getRecommendationUseCase(
        RecommendationParameters(movieID: movieID));
    result.fold(
      (l) => recommendationsMovies.value = recommendationsMovies.value.copyWith(
          recommendationsState: RequestState.error,
          recommendationsMessage: l.message),
      (r) => recommendationsMovies.value = recommendationsMovies.value.copyWith(
          recommendationsState: RequestState.loaded, recommendations: r),
    );
  }
}
