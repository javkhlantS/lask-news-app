import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/articles/widgets/article_metadata.dart';

class SearchResultArticleCard extends StatelessWidget {
  const SearchResultArticleCard({super.key});

  void navigateToArticle() {
    Get.toNamed(AppRouteNames.articleDetail);
  }

  @override
  Widget build(BuildContext context) {
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
                  "Experience the Serenity of Japan's Traditional Countryside",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextStyleExtensions.h5,
                ),
              ),
              const SizedBox(height: 4),
              const ArticleMetadata(),
            ],
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: navigateToArticle,
          child: Container(
            width: 112,
            height: 80,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              "https://images.pexels.com/photos/18887675/pexels-photo-18887675.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
