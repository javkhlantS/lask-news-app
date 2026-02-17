import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/article.dart';
import 'package:lask_news_app/core/models/author.dart';
import 'package:lask_news_app/core/models/picture.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/articles/controllers/article_detail_controller.dart';
import 'package:lask_news_app/features/articles/widgets/article_metadata.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ArticleDetailContent extends StatelessWidget {
  const ArticleDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ArticleDetailController>();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: MediaQuery.of(context).size.height * 0.29,
      child: Container(
        decoration: BoxDecoration(
          color: context.appColorsExtensions.backgroundPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Obx(() {
          final isLoading = controller.isLoading.value;
          final article = isLoading
              ? Article(
                  id: 1,
                  documentId: BoneMock.subtitle,
                  title: BoneMock.title,
                  content: BoneMock.words(200),
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
                )
              : controller.article.value!;

          return Skeletonizer(
            enabled: isLoading,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: kToolbarHeight + 24,
              ),
              children: [
                Text(
                  article.title,
                  style: context.appTextStyleExtensions.h3,
                ),
                const SizedBox(height: 16),
                ArticleMetadata(
                  author: article.author,
                  publishedAt: article.publishedAt,
                ),
                const SizedBox(height: 24),
                MarkdownBody(
                  data: article.content ?? '',
                  styleSheet: MarkdownStyleSheet(
                    p: context.appTextStyleExtensions.body1,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
