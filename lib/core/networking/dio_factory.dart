import 'package:banking_app2/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static const String _baseUrl = ApiConstants.apiBaseUrl;
  static const String _token = "Bearer ${ApiConstants.apiToken}";

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: {
          "Authorization": _token,
          "Content-Type": "application/json",
        },
      ));
      addDioInterceptor();
    }

    return dio!;
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
  }
}
