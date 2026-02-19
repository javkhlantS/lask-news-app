import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
    this.titleColor,
    this.showChevron = true,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? titleColor;
  final bool showChevron;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final resolvedIconColor =
        iconColor ?? context.appColorsExtensions.brandBlue;
    final resolvedTitleColor =
        titleColor ?? context.appColorsExtensions.textPrimary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: resolvedIconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: resolvedIconColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: context.appTextStyleExtensions.body1Semibold.copyWith(
                      color: resolvedTitleColor,
                    ),
                  ),
                ),
                if (trailing != null)
                  trailing!
                else if (showChevron)
                  Icon(
                    Icons.chevron_right_rounded,
                    color: context.appColorsExtensions.grey4,
                    size: 22,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
