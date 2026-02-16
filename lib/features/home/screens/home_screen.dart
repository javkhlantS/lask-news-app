import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/models/category.dart';
import 'package:lask_news_app/core/models/picture.dart';
import 'package:lask_news_app/features/home/controllers/home_controller.dart';
import 'package:lask_news_app/features/home/widgets/home_appbar.dart';
import 'package:lask_news_app/features/home/widgets/home_articles_by_category.dart';
import 'package:lask_news_app/features/home/widgets/home_featured_articles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: const HomeAppbar(),
      body: RefreshIndicator(
        onRefresh: controller.fetchHome,
        child: ListView(
          padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).padding.bottom + 24,
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            const HomeFeaturedArticles(),
            Obx(() {
              final isLoading = controller.isLoading.value;
              final categories = !isLoading
                  ? (controller.homeData.value?.featuredCategories ?? [])
                  : List.filled(
                      2,
                      Category(
                        id: 1,
                        documentId: BoneMock.subtitle,
                        title: BoneMock.title,
                        slug: BoneMock.subtitle,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        publishedAt: DateTime.now(),
                        order: 1,
                        articles: List.filled(
                          3,
                          Article(
                            id: 1,
                            documentId: BoneMock.subtitle,
                            title: BoneMock.time,
                            picture: Picture(
                              id: 1,
                              documentId: BoneMock.subtitle,
                              url: "",
                            ),
                          ),
                        ),
                      ),
                    );

              return Skeletonizer(
                enabled: isLoading,
                child: Column(
                  children: categories
                      .map(
                        (category) => Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: HomeArticlesByCategory(category: category),
                        ),
                      )
                      .toList(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
