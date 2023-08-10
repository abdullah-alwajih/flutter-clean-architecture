import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(error);
      case DioExceptionType.cancel:
        return const ServerFailure('Cancel');
      case DioExceptionType.connectionError:
        return const ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        return const ServerFailure('Connection Error');
    }
  }

  factory ServerFailure.fromBadResponse(DioException error) {
    return ServerFailure(error.message ?? error.response?.data['message']);
    // final int statusCode = error.response?.statusCode ?? 500;
    // if (statusCode >= 500) {
    //   return ServerFailure(error.message ?? '');
    // } else {
    //   return ServerFailure(error.message ?? '');
    // }
  }
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
