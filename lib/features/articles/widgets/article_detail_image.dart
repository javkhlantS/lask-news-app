import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/utils/picture_utils.dart';
import 'package:lask_news_app/features/articles/controllers/article_detail_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ArticleDetailImage extends StatelessWidget {
  const ArticleDetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ArticleDetailController>();

    return Obx(
      () => Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: MediaQuery.of(context).size.height * 0.59,
        child: Skeletonizer(
          enabled: controller.isLoading.value,
          child: Skeleton.replace(
            replacement: const Bone(),
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              PictureUtils.getFullUrl(
                url: controller.article.value?.picture.url ?? '',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
