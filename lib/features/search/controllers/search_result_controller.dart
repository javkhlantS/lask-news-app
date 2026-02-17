import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/repositories/article_repository.dart';

class SearchResultController extends GetxController {
  final _articleRepository = ArticleRepository();
  final articles = <Article>[].obs;
  final isArticlesLoading = true.obs;

  final categories = [
    {"label": "All", "count": 152},
    {"label": "Travel", "count": 51},
    {"label": "Technology", "count": 26},
    {"label": "Biology", "count": 22},
    {"label": "Sports", "count": 11},
  ];

  final selectedCategoryIndex = 0.obs;

  final arguments = Get.arguments as Map<String, String>;
  late final searchValue = arguments["search"];

  void categoryChange(int index) {
    if (selectedCategoryIndex.value == index) return;

    selectedCategoryIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    isArticlesLoading.value = true;

    await Future.delayed(const Duration(seconds: 3));

    try {
      articles.value = await _articleRepository.getArticles(
        query: {
          "sort": "publishedAt",
          "fields": ["id", "title", "publishedAt"],
          "populate": {
            "picture": {
              "fields": ["id", "url"],
            },
            "createdBy": {
              "fields": [
                "id",
                "firstname",
                "lastname",
                "createdAt",
                "publishedAt",
                "updatedAt",
              ],
            },
          },
          "filters": searchValue == null
              ? null
              : {
                  "title": {
                    "\$containsi": searchValue,
                  },
                },
        },
      );
    } catch (e) {
      log("Failed to fetch articles: $e");
    } finally {
      isArticlesLoading.value = false;
    }
  }
}
