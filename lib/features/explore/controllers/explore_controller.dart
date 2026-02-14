import 'package:get/get.dart';

class ExploreController extends GetxController {
  final categories = [
    "Travel",
    "Technology",
    "Business",
    "Economy",
    "Sports",
  ];

  late final RxString currentCategory = "".obs;

  void categoryChange(int index) {
    final newCategory = categories[index];
    if (newCategory == currentCategory.value) {
      currentCategory.value = "";
      return;
    }

    currentCategory.value = newCategory;
  }
}
