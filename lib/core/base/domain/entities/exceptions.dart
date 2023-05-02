import 'error_message.dart';

class ServerException implements Exception {
  final ErrorMessage errorMessage;

  ServerException(this.errorMessage);
}

class LocalDatabaseException implements Exception {
  final ErrorMessage errorMessage;

  LocalDatabaseException(this.errorMessage);
}
