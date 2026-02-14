import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/bookmark/controllers/bookmark_controller.dart';

class BookmarkArticleCard extends StatelessWidget {
  const BookmarkArticleCard({super.key});

  void navigateToArticle() {
    Get.toNamed(AppRouteNames.articleDetail);
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
                  "Discovering Hidden Gems: 8 Off-The-Beaten-Path Travel Destinations",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextStyleExtensions.h5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Interior",
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
              "https://images.pexels.com/photos/18887675/pexels-photo-18887675.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Obx(() {
          final isEditing = controller.editBookmark.value;
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
                            onTap: () {},
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
                                Icons.bookmark,
                                size: 20,
                                color:
                                    context.appColorsExtensions.textSecondary,
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
