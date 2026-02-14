import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/models/category.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/explore/controllers/explore_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreController>();

    return Obx(() {
      final isLoading = controller.isCategoriesLoading.value;
      final List<Category> items = isLoading
          ? List.filled(
              7,
              Category(
                createdAt: DateTime.now(),
                documentId: BoneMock.words(1),
                id: 1,
                order: 1,
                publishedAt: DateTime.now(),
                slug: BoneMock.subtitle,
                title: BoneMock.title,
                updatedAt: DateTime.now(),
              ),
            )
          : controller.categories;

      return Skeletonizer(
        enabled: isLoading,
        child: SizedBox(
          height: 36,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              if (isLoading) {
                return _CategoryItem(
                  isActive: false,
                  category: items[i],
                  onTap: () {},
                );
              }

              return Obx(() {
                final isActive =
                    controller.categories[i] ==
                    controller.currentCategory.value;

                return _CategoryItem(
                  isActive: isActive,
                  category: items[i],
                  onTap: () => controller.categoryChange(i),
                );
              });
            },
          ),
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
  });

  final bool isActive;
  final Category category;
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
            category.title,
            style: context.appTextStyleExtensions.body2Semibold,
          ),
        ),
      ),
    );
  }
}
