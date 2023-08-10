part of '../movies.dart';

class NowPlayingList extends StatelessWidget {
  final List<Movie> nowPlayingMovies;

  const NowPlayingList({Key? key, required this.nowPlayingMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          viewportFraction: 1.0,
        ),
        items: nowPlayingMovies
            .map((item) => buildNowPlayingItem(context, item))
            .toList(),
      ),
    );
  }
}
