import 'package:flutter/material.dart';
import 'package:lask_news_app/features/explore/widgets/explore_appbar.dart';
import 'package:lask_news_app/features/explore/widgets/explore_articles.dart';
import 'package:lask_news_app/features/explore/widgets/explore_categories.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ExploreAppbar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
        ),
        child: Column(
          children: [
            ExploreCategories(),
            SizedBox(height: 24),
            Expanded(child: ExploreArticles()),
          ],
        ),
      ),
    );
  }
}
