import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/repositories/article_repository.dart';

class SearchResultController extends GetxController {
  final _articleRepository = ArticleRepository();
  final articles = <Article>[].obs;
  final filteredArticles = <Article>[].obs;
  final isArticlesLoading = true.obs;

  final categories = <Map<String, dynamic>>[].obs;
  final selectedCategoryIndex = 0.obs;

  final arguments = Get.arguments as Map<String, String>;
  late final searchValue = arguments["search"];

  void categoryChange(int index) {
    if (selectedCategoryIndex.value == index) return;
    selectedCategoryIndex.value = index;
    _applyFilter();
  }

  void _computeCategories() {
    final Map<String, int> countMap = {};
    for (final article in articles) {
      for (final category in article.categories ?? []) {
        countMap[category.title] = (countMap[category.title] ?? 0) + 1;
      }
    }

    categories.value = [
      {"label": "All", "count": articles.length},
      ...countMap.entries.map((e) => {"label": e.key, "count": e.value}),
    ];
  }

  void _applyFilter() {
    if (selectedCategoryIndex.value == 0) {
      filteredArticles.value = articles.toList();
      return;
    }
    final selectedLabel =
        categories[selectedCategoryIndex.value]['label'] as String;
    filteredArticles.value = articles
        .where(
          (a) => a.categories?.any((c) => c.title == selectedLabel) ?? false,
        )
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    isArticlesLoading.value = true;

    await Future.delayed(Duration(seconds: 3));

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
            "categories": {
              "fields": [
                "id",
                "title",
                "slug",
                "createdAt",
                "updatedAt",
                "publishedAt",
                "order",
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
      _computeCategories();
      selectedCategoryIndex.value = 0;
      _applyFilter();
    } catch (e) {
      log("Failed to fetch articles: $e");
    } finally {
      isArticlesLoading.value = false;
    }
  }
}
