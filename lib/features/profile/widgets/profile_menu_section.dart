import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            title.toUpperCase(),
            style: context.appTextStyleExtensions.footnoteSemibold.copyWith(
              color: context.appColorsExtensions.textSecondary,
              letterSpacing: 1.0,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: context.appColorsExtensions.backgroundPrimary,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.appColorsExtensions.grey2,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                items[i],
                if (i < items.length - 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      height: 1,
                      color: context.appColorsExtensions.grey1,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
