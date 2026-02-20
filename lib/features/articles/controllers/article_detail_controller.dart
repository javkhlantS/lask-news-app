import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/repositories/article_repository.dart';
import 'package:lask_news_app/core/repositories/user_repository.dart';

class ArticleDetailController extends GetxController {
  final arguments = Get.arguments as Map<String, dynamic>;
  late final String documentId = arguments["documentId"];

  final _articleRepository = ArticleRepository();
  final _userRepository = UserRepository();
  final _authController = Get.find<AuthController>();

  final article = Rxn<Article>();
  final isLoading = true.obs;
  final isBookmarkLoading = false.obs;

  bool get isBookmarked {
    final user = _authController.currentUser.value;
    final currentArticle = article.value;
    if (user == null || currentArticle == null) return false;
    return user.bookmarkArticles.any((a) => a.id == currentArticle.id);
  }

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
  }

  Future<void> toggleBookmark() async {
    final user = _authController.currentUser.value;
    final currentArticle = article.value;
    if (user == null || currentArticle == null || isBookmarkLoading.value) {
      return;
    }

    isBookmarkLoading.value = true;
    try {
      await _userRepository.updateBookmarkArticle(
        userId: user.id,
        articleId: currentArticle.id,
        connect: !isBookmarked,
      );
      await _authController.fetchCurrentUser();
    } catch (e) {
      log('Failed to toggle bookmark: $e');
    } finally {
      isBookmarkLoading.value = false;
    }
  }

  Future<void> fetchArticle() async {
    isLoading.value = true;

    try {
      article.value = await _articleRepository.getArticle(
        documentId: documentId,
        query: {
          "fields": ["id", "title", "content", "publishedAt"],
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
        },
      );
    } catch (e) {
      log('Failed to fetch article: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
