import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/articles/widgets/article_metadata.dart';

class ExploreFeaturedArticleCard extends StatelessWidget {
  const ExploreFeaturedArticleCard({super.key});

  void navigateToArticle() {
    Get.toNamed(AppRouteNames.articleDetail);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: navigateToArticle,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: AspectRatio(
              aspectRatio: 366 / 206,
              child: Image.network(
                "https://images.pexels.com/photos/18887675/pexels-photo-18887675.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: navigateToArticle,
                child: Text(
                  "Uncovering the Hidden Gems of the Amazon Forest",
                  style: context.appTextStyleExtensions.h4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 12),
              const ArticleMetadata(),
            ],
          ),
        ),
      ],
    );
  }
}
