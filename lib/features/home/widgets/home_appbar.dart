import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final currentUser =
                  Get.find<AuthController>().currentUser.value;
              return RichText(
                text: TextSpan(
                  style: context.appTextStyleExtensions.body2.copyWith(
                    color: context.appColorsExtensions.textSecondary,
                  ),
                  children: [
                    const TextSpan(text: "Good Morning,\n"),
                    TextSpan(text: currentUser?.username ?? "Guest"),
                  ],
                ),
              );
            }),
            Text(
              DateFormat('EEE d MMM, y').format(DateTime.now()),
              style: context.appTextStyleExtensions.h5,
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: 24),
      actions: [
        Row(
          children: [
            const Text(
              "☀️",
              style: TextStyle(
                fontSize: 20,
                fontFamily: null, // Use system default font for emoji support
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "Sunny 32°C",
              style: context.appTextStyleExtensions.body2Semibold.copyWith(
                color: context.appColorsExtensions.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
