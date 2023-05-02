import '../../domain/entities/error_message.dart';

class ErrorMessageModel extends ErrorMessage {
  const ErrorMessageModel({
    required super.statusCode,
    required super.statusMessage,
    required super.success,
  });

  factory ErrorMessageModel.fromMap(Map<String, dynamic> map) =>
      ErrorMessageModel(
        statusCode: map['status_code'],
        statusMessage: map['status_message'],
        success: map['success'],
      );

  Map<String, dynamic> toMap() => {
        'status_code': statusCode,
        'status_message': statusMessage,
        'success': success,
      };
}
