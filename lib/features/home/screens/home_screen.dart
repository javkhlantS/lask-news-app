import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/features/home/controllers/home_controller.dart';
import 'package:lask_news_app/features/home/widgets/home_appbar.dart';
import 'package:lask_news_app/features/home/widgets/home_articles_by_category.dart';
import 'package:lask_news_app/features/home/widgets/home_featured_articles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: const HomeAppbar(),
      body: ListView(
        padding: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        physics: const BouncingScrollPhysics(),
        children: const [
          HomeFeaturedArticles(),
          SizedBox(height: 16),
          HomeArticlesByCategory(),
          SizedBox(height: 16),
          HomeArticlesByCategory(),
          SizedBox(height: 16),
          HomeArticlesByCategory(),
        ],
      ),
    );
  }
}
