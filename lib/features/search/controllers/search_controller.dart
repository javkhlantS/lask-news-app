import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  final textController = TextEditingController();
  final hasText = false.obs;

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      hasText.value = textController.text.isNotEmpty;
    });
  }

  void clearText() {
    textController.clear();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
