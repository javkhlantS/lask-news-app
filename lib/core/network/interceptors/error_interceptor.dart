import 'package:dio/dio.dart';
import 'package:lask_news_app/core/utils/snackbar_utils.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final message = switch (statusCode) {
      400 => 'Bad request. Please check your input.',
      401 => 'Unauthorized. Please check your credentials.',
      403 => 'Forbidden. You do not have access to this resource.',
      404 => 'Resource not found.',
      500 => 'Internal server error. Please try again later.',
      _ => err.message ?? 'An unexpected error occurred.',
    };

    SnackbarUtils.showError(
      err.response?.data["error"]["message"] ?? message,
    );

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: err.error,
        message: message,
      ),
    );
  }
}
