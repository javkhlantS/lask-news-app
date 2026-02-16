import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/bottom_nav_controller.dart';
import 'package:lask_news_app/core/models/category.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/explore/controllers/explore_controller.dart';
import 'package:lask_news_app/features/home/widgets/home_article_card.dart';

class HomeArticlesByCategory extends StatelessWidget {
  final Category category;

  const HomeArticlesByCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(category.title, style: context.appTextStyleExtensions.h4),
            TextButton(
              onPressed: () {
                Get.find<BottomNavController>().changePage(1);
                Get.find<ExploreController>().selectCategoryBySlug(
                  category.slug,
                );
              },
              style: context.appButtonStyleExtensions.ghostSmall,
              child: const Text("See More"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              category.articles?.length ?? 0,
              (index) => Padding(
                padding: EdgeInsets.only(right: index < 4 ? 24 : 0),
                child: HomeArticleCard(
                  article: category.articles![index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
