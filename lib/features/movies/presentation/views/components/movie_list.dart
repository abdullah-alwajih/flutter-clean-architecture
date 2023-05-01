part of '../movies.dart';

Widget buildMoviesList(List<Movie> movies) {
  return FadeIn(
    duration: const Duration(milliseconds: 500),
    child: SizedBox(
      height: 170.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: movies.length,
        itemBuilder: (context, index) =>
            buildMovieItem(context, movies[index]),
      ),
    ),
  );
}