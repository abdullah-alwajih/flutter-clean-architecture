import 'package:equatable/equatable.dart';

class ErrorMessage extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessage({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}
