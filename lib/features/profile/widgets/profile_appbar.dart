import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class ProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Profile',
        style: context.appTextStyleExtensions.h4,
      ),
      centerTitle: false,
      backgroundColor: context.appColorsExtensions.backgroundPrimary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(
          height: 1,
          color: context.appColorsExtensions.grey2,
        ),
      ),
    );
  }
}
