import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/features/bookmark/controllers/bookmark_controller.dart';
import 'package:lask_news_app/features/bookmark/widgets/bookmark_appbar.dart';
import 'package:lask_news_app/features/bookmark/widgets/bookmark_article_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookmarkController());

    return Scaffold(
      appBar: const BookmarkAppbar(),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) => const BookmarkArticleCard(),
        itemCount: 10,
      ),
    );
  }
}
