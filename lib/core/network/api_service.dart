import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import 'error_message.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future get(String path) async => await _dio.get(path);
  // Future get(String path) async => _getResponseData(await _dio.get(path));

  _getResponseData(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(ErrorMessageModel.fromMap(response.data));
    }
  }
}
