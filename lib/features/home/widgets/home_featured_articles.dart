import 'package:flutter/material.dart';
import 'package:lask_news_app/features/home/widgets/home_article_card.dart';

class HomeFeaturedArticles extends StatelessWidget {
  const HomeFeaturedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          5,
          (index) => Padding(
            padding: EdgeInsets.only(right: index < 4 ? 24 : 0),
            child: const HomeArticleCard(),
          ),
        ),
      ),
    );
  }
}
