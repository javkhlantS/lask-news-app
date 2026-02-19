import 'package:get/get.dart';
import 'package:lask_news_app/core/network/dio_client.dart';

class AuthRepository {
  final _dioClient = Get.find<DioClient>();

  Future<String> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.dio.post(
      "/auth/local/register",
      data: {
        "username": username,
        "email": email,
        "password": password,
      },
    );
    return response.data["jwt"] as String;
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.dio.post(
      "/auth/local",
      data: {
        "identifier": email,
        "password": password,
      },
    );

    return response.data["jwt"] as String;
  }
}
