import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/utils/storage_utils.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = dotenv.env['BACKEND_API_TOKEN'];
    final jwt = StorageUtils.read("jwt");

    if ((jwt != null || (token != null && token.isNotEmpty)) &&
        !options.uri.path.contains("local")) {
      options.headers['Authorization'] = 'Bearer ${jwt ?? token}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && StorageUtils.hasKey("jwt")) {
      await StorageUtils.remove("jwt");
      final authController = Get.find<AuthController>();
      authController.currentUser.value = null;

      // Retry with the public API token
      final token = dotenv.env['BACKEND_API_TOKEN'];
      final options = err.requestOptions;
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      } else {
        options.headers.remove('Authorization');
      }

      try {
        final response = await dio.fetch(options);
        handler.resolve(response);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }
    handler.next(err);
  }
}
