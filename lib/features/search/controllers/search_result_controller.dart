import 'package:get/get.dart';

class SearchResultController extends GetxController {
  final categories = [
    {"label": "All", "count": 152},
    {"label": "Travel", "count": 51},
    {"label": "Technology", "count": 26},
    {"label": "Biology", "count": 22},
    {"label": "Sports", "count": 11},
  ];

  final selectedCategoryIndex = 0.obs;

  void categoryChange(int index) {
    if (selectedCategoryIndex.value == index) return;

    selectedCategoryIndex.value = index;
  }
}
