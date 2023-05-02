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

  factory ServerFailure.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return const ServerFailure('Connection Timeout');
      case DioErrorType.sendTimeout:
        return const ServerFailure('Send Timeout');
      case DioErrorType.receiveTimeout:
        return const ServerFailure('Receive Timeout');
      case DioErrorType.badCertificate:
        return const ServerFailure('Receive Timeout');
      case DioErrorType.badResponse:
        return ServerFailure.fromBadResponse(error);
      case DioErrorType.cancel:
        return const ServerFailure('Cancel');
      case DioErrorType.connectionError:
        return const ServerFailure('Connection Error');
      case DioErrorType.unknown:
        return const ServerFailure('Connection Error');
    }
  }

  factory ServerFailure.fromBadResponse(DioError error) {
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
