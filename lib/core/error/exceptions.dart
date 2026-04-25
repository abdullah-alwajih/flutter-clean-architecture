import '../network/error_message.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException(this.errorMessageModel);
}

class LocalDatabaseException implements Exception {
  final ErrorMessageModel errorMessageModel;

  LocalDatabaseException(this.errorMessageModel);
}
