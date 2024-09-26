import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qarz_daftar/infrastructure/repo/storage_repository.dart';
import 'package:qarz_daftar/src/assets/constants/storage_keys.dart';
import 'package:qarz_daftar/utils/log_service.dart';

class DioSettings {
  BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: "https://backend.qarzdaftar.com/v1/",
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    headers: <String, dynamic>{
      'Authorization':
          'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
    },
    validateStatus: (status) => status != null && status <= 500,
  );

  void setBaseOptions({String? lang, String? token}) {
    _dioBaseOptions = BaseOptions(
      baseUrl: "https://backend.qarzdaftar.com/v1/",
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 35000),
      headers: <String, dynamic>{
        'Authorization':
            'Bearer ${token ?? StorageRepository.getString(StorageKeys.TOKEN)}',
      },
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    );
  }

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio => Dio(_dioBaseOptions)
    ..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: kDebugMode,
          request: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
          error: kDebugMode,
        ),
        ErrorHandlerInterceptor(),
      ],
    );
}

class ErrorHandlerInterceptor implements Interceptor {
  ErrorHandlerInterceptor._();

  static final _instance = ErrorHandlerInterceptor._();

  factory ErrorHandlerInterceptor() => _instance;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionTimeout) {
      Log.e("Time Out");
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {}
    handler.next(response);
  }
}
