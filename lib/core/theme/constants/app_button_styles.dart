import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/constants/app_dark_colors.dart';
import 'package:lask_news_app/core/theme/constants/app_light_colors.dart';
import 'package:lask_news_app/core/theme/constants/app_typography.dart';

abstract class AppButtonStyles {
  static ButtonStyle filledLarge = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: AppLightColors.brand.blue,
    textStyle: AppTypography.button1.copyWith(color: Colors.white),
    iconColor: Colors.white,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
  );

  static ButtonStyle filledSmall = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: AppLightColors.brand.blue,
    textStyle: AppTypography.button2.copyWith(color: Colors.white),
    iconColor: Colors.white,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
  );

  static ButtonStyle outlinedLarge = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.transparent,
    textStyle: AppTypography.button1.copyWith(color: AppLightColors.brand.blue),
    iconColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    foregroundColor: AppLightColors.brand.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(128),
      side: BorderSide(width: 1, color: AppLightColors.brand.blue),
    ),
  );

  static ButtonStyle outlinedSmall = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.transparent,
    textStyle: AppTypography.button2.copyWith(color: AppLightColors.brand.blue),
    iconColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    foregroundColor: AppLightColors.brand.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(128),
      side: BorderSide(width: 1, color: AppLightColors.brand.blue),
    ),
  );

  static ButtonStyle secondaryLarge = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: AppLightColors.brand.blue10,
    textStyle: AppTypography.button1.copyWith(color: AppLightColors.brand.blue),
    iconColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    foregroundColor: AppLightColors.brand.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
  );

  static ButtonStyle secondarySmall = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: AppLightColors.brand.blue10,
    textStyle: AppTypography.button2.copyWith(color: AppLightColors.brand.blue),
    iconColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    foregroundColor: AppLightColors.brand.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
  );

  static ButtonStyle ghostLarge = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.transparent,
    textStyle: AppTypography.button1.copyWith(color: AppLightColors.brand.blue),
    iconColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
    foregroundColor: AppLightColors.brand.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
    overlayColor: Colors.transparent,
  );

  static ButtonStyle ghostSmall = TextButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.transparent,
    textStyle: AppTypography.button2.copyWith(color: AppLightColors.brand.blue),
    iconColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
    foregroundColor: AppLightColors.brand.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
    overlayColor: Colors.transparent,
  );

  static ButtonStyle filledIcon = IconButton.styleFrom(
    elevation: 0,
    backgroundColor: AppLightColors.brand.blue,
    foregroundColor: Colors.white,
    iconSize: 16,
    padding: const EdgeInsets.all(14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle outlinedIcon = IconButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.all(14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(width: 1, color: AppLightColors.brand.blue),
    ),
  );

  static ButtonStyle secondaryIcon = IconButton.styleFrom(
    elevation: 0,
    backgroundColor: AppLightColors.brand.blue10,
    foregroundColor: AppLightColors.brand.blue,
    iconSize: 16,
    padding: const EdgeInsets.all(14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle ghostIcon = IconButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: AppLightColors.text.primary,
    iconSize: 16,
    padding: const EdgeInsets.all(14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static ButtonStyle ghostIconDark = IconButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: AppDarkColors.text.primary,
    iconSize: 16,
    padding: const EdgeInsets.all(14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
