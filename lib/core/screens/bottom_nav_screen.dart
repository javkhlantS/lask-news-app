import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/bottom_nav_controller.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/widgets/bottom_nav_item.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: MediaQuery.of(context).padding.bottom + 60,
            decoration: BoxDecoration(
              color: context.appColorsExtensions.backgroundBottomNav.withValues(
                alpha: 0.6,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                for (int i = 0; i < controller.items.length; i++)
                  Obx(() {
                    final isActive = i == controller.currentIndex.value;

                    return BottomNavItem(
                      isActive: isActive,
                      onTap: () => controller.changePage(i),
                      label: controller.items[i]['label'] as String,
                      icon: controller.items[i]['icon'] as IconData,
                    );
                  }),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.screens,
        ),
      ),
    );
  }
}
