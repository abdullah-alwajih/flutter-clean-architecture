import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/movie.dart';
import '../repository/base_movies.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    // here can check permission
    return await baseMoviesRepository.getTopRatedMovies();
  }
}