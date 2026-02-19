import 'package:get/get.dart';
import 'package:lask_news_app/core/models/user.dart';
import 'package:lask_news_app/core/network/dio_client.dart';

class UserRepository {
  final _dioClient = Get.find<DioClient>();

  Future<User> getMe() async {
    final response = await _dioClient.dio.get("/users/me");
    return User.fromJson(response.data);
  }
}
