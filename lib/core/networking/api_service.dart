import 'package:banking_app2/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Map<String, dynamic>> sendRequest(
      Map<String, dynamic> requestBody) async {
    final response =
        await _dio.post(ApiConstants.apiBaseUrl, data: requestBody);

    return response.data as Map<String, dynamic>;
  }
}
