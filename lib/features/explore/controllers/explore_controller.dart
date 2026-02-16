import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/models/category.dart';
import 'package:lask_news_app/core/repositories/article_repository.dart';
import 'package:lask_news_app/core/repositories/category_repository.dart';

class ExploreController extends GetxController {
  final _categoryRepository = CategoryRepository();
  final _articleRepository = ArticleRepository();

  final categories = <Category>[].obs;
  final currentCategory = Rxn<Category>();
  final isCategoriesLoading = true.obs;

  final articles = <Article>[].obs;
  final isArticlesLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchCategories(), fetchArticles()]);
  }

  Future<void> fetchCategories() async {
    isCategoriesLoading.value = true;

    try {
      categories.value = await _categoryRepository.getCategories(sort: 'order');
      log(
        'Categories: ${categories.map((c) => c.title).toList()}',
        name: 'ExploreController',
      );
    } catch (e) {
      log('Failed to fetch categories: $e', name: 'ExploreController');
    } finally {
      isCategoriesLoading.value = false;
    }
  }

  void categoryChange(int index) {
    final newCategory = categories[index];
    if (newCategory == currentCategory.value) {
      currentCategory.value = null;
      fetchArticles();
      return;
    }

    currentCategory.value = newCategory;
    fetchArticles();
  }

  Future<void> fetchArticles({bool showLoading = true}) async {
    if (showLoading) isArticlesLoading.value = true;

    try {
      articles.value = await _articleRepository.getArticles(
        query: {
          "sort": "publishedAt",
          "fields": ["id", "title", "publishedAt"],
          "populate": {
            "picture": {
              "fields": ["id", "url"],
            },
            "author": {
              "populate": ["avatar"],
            },
          },
          "filters": currentCategory.value != null
              ? {
                  "categories": {
                    "slug": {"\$eq": currentCategory.value!.slug},
                  },
                }
              : null,
        },
      );
      log('Articles count: ${articles.length}');
    } catch (e) {
      log('Failed to fetch articles: $e');
    } finally {
      if (showLoading) isArticlesLoading.value = false;
    }
  }

  Future<void> refreshData() async {
    await Future.wait([
      fetchCategories(),
      fetchArticles(showLoading: false),
    ]);
  }
}
