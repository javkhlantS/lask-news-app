import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/network/dio_client.dart';

class ArticleRepository {
  final _dioClient = Get.find<DioClient>();

  Future<List<Article>> getArticles({Map<String, dynamic>? query}) async {
    final response = await _dioClient.dio.get(
      "/articles",
      queryParameters: query,
    );

    final List data = response.data['data'];
    return data.map((json) => Article.fromJson(json)).toList();
  }

  Future<Article> getArticle({
    required String documentId,
    Map<String, dynamic>? query,
  }) async {
    final response = await _dioClient.dio.get(
      "/articles/$documentId",
      queryParameters: query,
    );

    final data = response.data['data'];
    return Article.fromJson(data);
  }
}
