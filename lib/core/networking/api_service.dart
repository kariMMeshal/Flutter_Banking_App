import 'package:banking_app2/core/networking/api_constants.dart';
import 'package:banking_app2/core/networking/api_error_handler.dart';
import 'package:banking_app2/core/networking/chat_request.dart';
import 'package:banking_app2/core/networking/chat_response.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      headers: {
        'Authorization': 'Bearer ${ApiConstants.apiToken}',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<ChatResponse> sendMessage(ChatRequest request) async {
    try {
      final response = await _dio.post(
        '',
        data: request.toJson(),
      );

      return ChatResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).apiErrorModel;
    }
  }
}
