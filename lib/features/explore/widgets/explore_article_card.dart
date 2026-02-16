import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/core/utils/picture_utils.dart';
import 'package:lask_news_app/features/articles/widgets/article_metadata.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreArticleCard extends StatelessWidget {
  const ExploreArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  void navigateToArticle() {
    Get.toNamed(
      AppRouteNames.articleDetail,
      arguments: {"documentId": article.documentId},
    );
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
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextStyleExtensions.h5,
                ),
              ),
              const SizedBox(height: 4),
              ArticleMetadata(
                publishedAt: article.publishedAt,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: navigateToArticle,
          child: Container(
            width: 112,
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.hardEdge,
            child: Skeleton.replace(
              replacement: const Bone(),
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                PictureUtils.getFullUrl(url: article.picture.url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
