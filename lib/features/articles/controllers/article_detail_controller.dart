import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/repositories/article_repository.dart';

class ArticleDetailController extends GetxController {
  final arguments = Get.arguments as Map<String, dynamic>;
  late final String documentId = arguments["documentId"];

  final _articleRepository = ArticleRepository();

  final article = Rxn<Article>();
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
  }

  Future<void> fetchArticle() async {
    isLoading.value = true;

    try {
      article.value = await _articleRepository.getArticle(
        documentId: documentId,
        query: {
          "populate": {
            "picture": {
              "fields": ["id", "url"],
            },
          },
        },
      );
    } catch (e) {
      log('Failed to fetch article: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
