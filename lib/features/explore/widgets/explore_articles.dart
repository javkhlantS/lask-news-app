import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/models/picture.dart';
import 'package:lask_news_app/features/explore/controllers/explore_controller.dart';
import 'package:lask_news_app/features/explore/widgets/explore_article_card.dart';
import 'package:lask_news_app/features/explore/widgets/explore_featured_article_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreArticles extends StatelessWidget {
  const ExploreArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreController>();

    return Obx(() {
      final isLoading = controller.isArticlesLoading.value;

      final List<Article> articles = isLoading
          ? List.filled(
              10,
              Article(
                id: 1,
                documentId: BoneMock.words(1),
                title: BoneMock.title,
                picture: Picture(
                  id: 1,
                  documentId: BoneMock.words(1),
                  url: "",
                ),
              ),
            )
          : controller.articles;

      return Skeletonizer(
        enabled: isLoading,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 16,
          ),
          itemBuilder: (context, index) {
            final article = articles[index];

            if (index == 0) {
              return ExploreFeaturedArticleCard(article: article);
            }

            return ExploreArticleCard(article: article);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 24);
          },
          itemCount: articles.length,
        ),
      );
    });
  }
}
