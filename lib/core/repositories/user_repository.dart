import 'package:get/get.dart';
import 'package:lask_news_app/core/models/user.dart';
import 'package:lask_news_app/core/network/dio_client.dart';

class UserRepository {
  final _dioClient = Get.find<DioClient>();

  Future<void> updateBookmarkArticle({
    required int userId,
    required int articleId,
    required bool connect,
  }) async {
    await _dioClient.dio.put(
      "/users/$userId",
      data: {
        "bookmark_articles": {
          connect ? "connect" : "disconnect": [articleId],
        },
      },
    );
  }

  Future<void> bulkUpdateBookmarkArticles({
    required int userId,
    List<int> connect = const [],
    List<int> disconnect = const [],
  }) async {
    final Map<String, dynamic> operations = {};
    if (connect.isNotEmpty) operations['connect'] = connect;
    if (disconnect.isNotEmpty) operations['disconnect'] = disconnect;
    if (operations.isEmpty) return;

    await _dioClient.dio.put(
      "/users/$userId",
      data: {"bookmark_articles": operations},
    );
  }

  Future<User> getMe() async {
    final response = await _dioClient.dio.get(
      "/users/me",
      queryParameters: {
        "populate": {
          "bookmark_articles": {
            "populate": ['picture', 'categories'],
          },
          "clapped_articles": {
            "populate": ['picture', 'categories'],
          },
        },
      },
    );
    return User.fromJson(response.data);
  }
}
