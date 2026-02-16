import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/home/widgets/home_article_card.dart';

class HomeArticlesByCategory extends StatelessWidget {
  const HomeArticlesByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Just For You", style: context.appTextStyleExtensions.h4),
            TextButton(
              onPressed: () {},
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
              5,
              (index) => Padding(
                padding: EdgeInsets.only(right: index < 4 ? 24 : 0),
                // child: const HomeArticleCard(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
