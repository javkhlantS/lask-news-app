import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';

class ArticleDetailBottomNav extends StatelessWidget {
  const ArticleDetailBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: context.appColorsExtensions.backgroundBottomNav.withValues(
              alpha: 0.6,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                style: context.appButtonStyleExtensions.ghostIcon,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_outline),
                    style: context.appButtonStyleExtensions.ghostIcon,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined),
                    style: context.appButtonStyleExtensions.ghostIcon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
