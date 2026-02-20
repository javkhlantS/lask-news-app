import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/repositories/user_repository.dart';

class BookmarkController extends GetxController {
  final _userRepository = UserRepository();
  final _authController = Get.find<AuthController>();

  final editBookmark = false.obs;
  final selectedForRemoval = <int>{}.obs;
  final isApplying = false.obs;

  void toggleEdit() {
    editBookmark.value = !editBookmark.value;
    if (editBookmark.value) {
      selectedForRemoval.clear();
    }
  }

  void toggleSelection(int articleId) {
    if (selectedForRemoval.contains(articleId)) {
      selectedForRemoval.remove(articleId);
    } else {
      selectedForRemoval.add(articleId);
    }
  }

  Future<void> applyChangesAndFinishEdit() async {
    final user = _authController.currentUser.value;
    if (user == null || isApplying.value) return;

    if (selectedForRemoval.isEmpty) {
      toggleEdit();
      return;
    }

    isApplying.value = true;
    try {
      await _userRepository.bulkUpdateBookmarkArticles(
        userId: user.id,
        disconnect: selectedForRemoval.toList(),
      );
      await _authController.fetchCurrentUser();
    } catch (e) {
      log('Failed to apply bookmark changes: $e');
    } finally {
      isApplying.value = false;
      selectedForRemoval.clear();
      editBookmark.value = false;
    }
  }
}
