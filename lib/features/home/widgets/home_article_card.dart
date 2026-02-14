import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class HomeArticleCard extends StatelessWidget {
  const HomeArticleCard({super.key});

  void navigateToArticle() {
    Get.toNamed(AppRouteNames.articleDetail);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.65;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: navigateToArticle,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: width,
              height: width,
              child: Image.network(
                "https://images.pexels.com/photos/18887675/pexels-photo-18887675.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: navigateToArticle,
                  child: Text(
                    "Experience the Serenity of Japan's Traditional Countryside",
                    style: context.appTextStyleExtensions.h4,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Technology",
                  style: context.appTextStyleExtensions.body2.copyWith(
                    color: context.appColorsExtensions.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
