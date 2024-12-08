import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio;

  DioHelper({
    required String baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) : dio = Dio(
          BaseOptions(
            connectTimeout: connectTimeout ?? const Duration(seconds: 60),
            receiveTimeout: receiveTimeout ?? const Duration(seconds: 60),
            baseUrl: baseUrl,
            contentType: "application/json",
            responseType: ResponseType.json,
          ),
        )..interceptors.add(
            LogInterceptor(
              request: false,
              requestHeader: false,
              requestBody: true,
              responseHeader: false,
              responseBody: true,
            ),
          );
}
