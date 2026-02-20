import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/core/utils/picture_utils.dart';
import 'package:lask_news_app/features/bookmark/controllers/bookmark_controller.dart';

class BookmarkArticleCard extends StatelessWidget {
  final Article article;

  const BookmarkArticleCard({
    super.key,
    required this.article,
  });

  void navigateToArticle() {
    Get.toNamed(
      AppRouteNames.articleDetail,
      arguments: {
        "documentId": article.documentId,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookmarkController>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: navigateToArticle,
                child: Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextStyleExtensions.h5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                (article.categories ?? [])
                    .map((category) => category.title)
                    .join(", "),
                style: context.appTextStyleExtensions.footnote.copyWith(
                  color: context.appColorsExtensions.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: navigateToArticle,
          child: Container(
            width: 112,
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              PictureUtils.getFullUrl(url: article.picture.url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Obx(() {
          final isEditing = controller.editBookmark.value;
          final isMarkedForRemoval =
              controller.selectedForRemoval.contains(article.id);
          return AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.centerLeft,
            child: isEditing
                ? Row(
                    children: [
                      const SizedBox(width: 16),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        opacity: isEditing ? 1.0 : 0.0,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => controller.toggleSelection(article.id),
                            splashColor: context
                                .appColorsExtensions
                                .textSecondary
                                .withValues(alpha: 0.2),
                            highlightColor: context
                                .appColorsExtensions
                                .textSecondary
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Icon(
                                isMarkedForRemoval
                                    ? Icons.bookmark_border
                                    : Icons.bookmark,
                                size: 20,
                                color: isMarkedForRemoval
                                    ? context.appColorsExtensions.systemError
                                    : context.appColorsExtensions.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          );
        }),
      ],
    );
  }
}
