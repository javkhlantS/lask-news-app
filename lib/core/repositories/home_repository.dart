import 'package:get/get.dart';
import 'package:lask_news_app/core/models/home.dart';
import 'package:lask_news_app/core/network/dio_client.dart';

class HomeRepository {
  final _dioClient = Get.find<DioClient>();

  Future<Home> getHome() async {
    final response = await _dioClient.dio.get(
      "/home",
      queryParameters: {
        "populate": {
          "featured_articles": {
            "populate": ["picture", "categories"],
          },
          "featured_categories": {
            "populate": {
              "articles": {
                "populate": ["picture"],
              },
            },
          },
        },
      },
    );

    final data = response.data["data"];
    return Home.fromJson(data);
  }
}
