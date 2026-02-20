import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/bookmark/controllers/bookmark_controller.dart';

class BookmarkAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BookmarkAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookmarkController>();

    return AppBar(
      toolbarHeight: 68,
      titleSpacing: 24,
      title: const Text("Bookmark"),
      titleTextStyle: context.appTextStyleExtensions.h3,
      centerTitle: false,
      actionsPadding: const EdgeInsets.only(right: 24),
      actions: [
        Obx(
          () => controller.editBookmark.value
              ? TextButton(
                  onPressed: controller.applyChangesAndFinishEdit,
                  style: context.appButtonStyleExtensions.ghostSmall,
                  child: const Text("Done"),
                )
              : GestureDetector(
                  onTap: controller.toggleEdit,
                  child: Icon(
                    Icons.edit_outlined,
                    color: context.appColorsExtensions.textPrimary,
                    size: 22,
                  ),
                ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
