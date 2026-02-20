import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/bookmark/controllers/bookmark_controller.dart';
import 'package:lask_news_app/features/bookmark/widgets/bookmark_appbar.dart';
import 'package:lask_news_app/features/bookmark/widgets/bookmark_article_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookmarkController());
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: const BookmarkAppbar(),
      body: Obx(() {
        List<Article> articles =
            authController.currentUser.value?.bookmarkArticles ?? [];

        if (articles.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.bookmark_border_rounded,
                    size: 64,
                    color: context.appColorsExtensions.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "No bookmarks yet",
                    style: context.appTextStyleExtensions.h4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Articles you save will appear here",
                    style: context.appTextStyleExtensions.body2.copyWith(
                      color: context.appColorsExtensions.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(context).padding.bottom + 24,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemBuilder: (context, index) =>
              BookmarkArticleCard(article: articles[index]),
          itemCount: articles.length,
        );
      }),
    );
  }
}
