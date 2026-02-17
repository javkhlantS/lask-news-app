import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/models/author.dart';
import 'package:lask_news_app/core/models/picture.dart';
import 'package:lask_news_app/features/home/controllers/home_controller.dart';
import 'package:lask_news_app/features/home/widgets/home_article_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeFeaturedArticles extends StatelessWidget {
  const HomeFeaturedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      child: Obx(() {
        final isLoading = controller.isLoading.value;
        final List<Article> articles = !isLoading
            ? (controller.homeData.value?.featuredArticles ?? [])
            : List.filled(
                2,
                Article(
                  id: 1,
                  documentId: BoneMock.words(1),
                  title: BoneMock.title,
                  picture: Picture(
                    id: 1,
                    documentId: BoneMock.words(1),
                    url: "",
                  ),
                  author: Author(
                    id: 1,
                    documentId: BoneMock.subtitle,
                    createdAt: DateTime.now(),
                    firstName: BoneMock.name,
                    lastName: BoneMock.name,
                    publishedAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  ),
                ),
              );

        return Skeletonizer(
          enabled: isLoading,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              articles.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: index < 4 ? 24 : 0),
                child: HomeArticleCard(
                  article: articles[index],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
