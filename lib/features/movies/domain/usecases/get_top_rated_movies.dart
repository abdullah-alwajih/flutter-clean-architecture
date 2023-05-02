import 'package:dartz/dartz.dart';

import '../../../../core/base/domain/entities/failure.dart';
import '../../../../core/base/domain/entities/no_parameter.dart';
import '../../../../core/base/domain/usecase/base_use_case.dart';
import '../entities/movie.dart';
import '../repository/base_movies.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameters) async {
    // here can check permission
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
