import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
