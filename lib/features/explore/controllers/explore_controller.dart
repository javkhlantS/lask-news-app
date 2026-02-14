import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/models/category.dart';
import 'package:lask_news_app/core/repositories/category_repository.dart';

class ExploreController extends GetxController {
  final _categoryRepository = CategoryRepository();

  final categories = <Category>[].obs;
  final currentCategory = Rxn<Category>();
  final isCategoriesLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isCategoriesLoading.value = true;
    await Future.delayed(const Duration(seconds: 10));

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
      return;
    }

    currentCategory.value = newCategory;
  }
}
