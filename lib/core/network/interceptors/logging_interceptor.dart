import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      log('→ ${options.method} ${options.uri} ${options.data}', name: 'HTTP');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        '← ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}',
        name: 'HTTP',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        '✗ ${err.response?.statusCode ?? 'NO STATUS'} ${err.requestOptions.method} ${err.requestOptions.uri}',
        name: 'HTTP',
      );
    }
    handler.next(err);
  }
}
