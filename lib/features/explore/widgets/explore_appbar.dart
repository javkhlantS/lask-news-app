import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class ExploreAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ExploreAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 68,
      title: const Text("Explore"),
      titleTextStyle: context.appTextStyleExtensions.h3,
      titleSpacing: 24,
      centerTitle: false,
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRouteNames.search);
          },
          child: Icon(
            Icons.search,
            color: context.appColorsExtensions.textPrimary,
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.only(right: 24),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
