import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/search/controllers/search_result_controller.dart';
import 'package:lask_news_app/features/search/widgets/search_result_article_card.dart';
import 'package:lask_news_app/features/search/widgets/search_result_categories.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchResultController());

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
            const SearchResultCategories(),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    const SearchResultArticleCard(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
