import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
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

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}
