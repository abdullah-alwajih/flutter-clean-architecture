part of '../movies.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MoviesController>(
      init: Get.find<MoviesController>(),
      builder: (controller) {
        switch (controller.popular.value.popularState) {
          case RequestState.loading:
            return const SizedBox(
                height: 400.0,
                child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: controller.popular.value.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = controller.popular.value.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.moviesDetails,
                            arguments: movie.id),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: cachedNetworkImage(
                            ApiConstants.imageUrl(movie.backdropPath),
                            width: 120.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
                height: 400.0,
                child: Center(
                    child: Text(controller.popular.value.popularMessage)));
        }
      },
    );
  }
}
