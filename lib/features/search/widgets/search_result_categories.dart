import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/search/controllers/search_result_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultCategories extends StatelessWidget {
  const SearchResultCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchResultController>();

    return Obx(() {
      final List<dynamic> categories = controller.isArticlesLoading.value
          ? List.filled(5, {
              "label": BoneMock.title,
              "count": 10,
            })
          : controller.categories;

      return SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            for (int i = 0; i < categories.length; i++)
              _CategoryItem(
                isActive: i == controller.selectedCategoryIndex.value,
                category: categories[i]['label'] as String,
                count: categories[i]['count'] as int,
                onTap: () => controller.categoryChange(i),
              ),
          ],
        ),
      );
    });
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.isActive,
    required this.category,
    required this.onTap,
    required this.count,
  });

  final bool isActive;
  final String category;
  final VoidCallback onTap;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isActive ? null : onTap,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                category,
                style: context.appTextStyleExtensions.body2Semibold,
              ),
              const SizedBox(width: 4),
              Text(
                ' ($count)',
                style: context.appTextStyleExtensions.footnote.copyWith(
                  color: context.appColorsExtensions.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
