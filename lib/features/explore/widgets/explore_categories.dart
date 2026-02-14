import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/explore/controllers/explore_controller.dart';

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreController());

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          for (int i = 0; i < controller.categories.length; i++)
            Obx(() {
              final isActive =
                  controller.categories[i] == controller.currentCategory.value;

              return _CategoryItem(
                isActive: isActive,
                category: controller.categories[i],
                onTap: () => controller.categoryChange(i),
              );
            }),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.isActive,
    required this.category,
    required this.onTap,
  });

  final bool isActive;
  final String category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: context.appColorsExtensions.brandBlue.withValues(
          alpha: 0.2,
        ),
        highlightColor: context.appColorsExtensions.brandBlue.withValues(
          alpha: 0.1,
        ),
        borderRadius: BorderRadius.circular(56),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isActive
                ? context.appColorsExtensions.brandBlue10
                : context.appColorsExtensions.brandBlue10.withValues(alpha: 0),
            border: Border.all(
              width: 1,
              color: context.appColorsExtensions.brandBlue10,
            ),
            borderRadius: BorderRadius.circular(56),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Text(
            category,
            style: context.appTextStyleExtensions.body2Semibold,
          ),
        ),
      ),
    );
  }
}
