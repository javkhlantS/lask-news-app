import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/features/articles/controllers/article_detail_controller.dart';
import 'package:lask_news_app/features/articles/widgets/article_detail_bottom_nav.dart';
import 'package:lask_news_app/features/articles/widgets/article_detail_content.dart';
import 'package:lask_news_app/features/articles/widgets/article_detail_image.dart';

class ArticeDetailScreen extends StatelessWidget {
  const ArticeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArticleDetailController());

    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: ArticleDetailBottomNav(),
        body: Stack(
          children: [
            ArticleDetailImage(),
            ArticleDetailContent(),
          ],
        ),
      ),
    );
  }
}
