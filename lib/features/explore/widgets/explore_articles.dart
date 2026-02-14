import 'package:flutter/material.dart';
import 'package:lask_news_app/features/explore/widgets/explore_article_card.dart';
import 'package:lask_news_app/features/explore/widgets/explore_featured_article_card.dart';

class ExploreArticles extends StatelessWidget {
  const ExploreArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const ExploreFeaturedArticleCard();
        }

        return const ExploreArticleCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 24);
      },
      itemCount: 10,
    );
  }
}
