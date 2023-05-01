part of '../movies.dart';

Widget buildMovieItem(BuildContext context, Movie movie) {
  return Container(
    padding: const EdgeInsets.only(right: 8.0),
    child: InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.movieDetails,
          arguments: movie.id),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: cachedNetworkImage(
          ApiUrls.imageUrl(movie.backdropPath),
          width: 120.0,
        ),
      ),
    ),
  );
}
