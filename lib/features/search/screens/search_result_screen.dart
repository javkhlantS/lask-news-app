import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/models/author.dart';
import 'package:lask_news_app/core/models/picture.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/search/controllers/search_result_controller.dart';
import 'package:lask_news_app/features/search/widgets/search_result_article_card.dart';
import 'package:lask_news_app/features/search/widgets/search_result_categories.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchResultController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        automaticallyImplyLeading: false,
        backgroundColor: context.appColorsExtensions.backgroundPrimary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              size: 16,
              color: context.appColorsExtensions.textPrimary,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Search results",
          style: context.appTextStyleExtensions.h5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          children: [
            Obx(() {
              return Skeletonizer(
                enabled: controller.isArticlesLoading.value,
                child: const SearchResultCategories(),
              );
            }),
            const SizedBox(height: 24),
            Obx(() {
              final isLoading = controller.isArticlesLoading.value;
              final articles = isLoading
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
                    )
                  : controller.filteredArticles;

              if (!isLoading && articles.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.article_outlined,
                          size: 64,
                          color: context.appColorsExtensions.textSecondary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No articles found',
                          style: context.appTextStyleExtensions.body1Semibold
                              .copyWith(
                                color:
                                    context.appColorsExtensions.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Expanded(
                child: Skeletonizer(
                  enabled: isLoading,
                  child: ListView.separated(
                    itemBuilder: (context, index) => SearchResultArticleCard(
                      article: articles[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 24),
                    itemCount: articles.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
