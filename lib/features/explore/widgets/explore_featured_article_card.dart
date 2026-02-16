import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/core/utils/picture_utils.dart';
import 'package:lask_news_app/features/articles/widgets/article_metadata.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreFeaturedArticleCard extends StatelessWidget {
  const ExploreFeaturedArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

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
              child: Skeleton.replace(
                replacement: const Bone(),
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  PictureUtils.getFullUrl(url: article.picture.url),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
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
                  article.title,
                  style: context.appTextStyleExtensions.h4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 12),
              ArticleMetadata(
                author: article.author,
                publishedAt: article.publishedAt,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
