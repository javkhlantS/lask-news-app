import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/constants/app_light_colors.dart';
import 'package:lask_news_app/core/theme/constants/app_typography.dart';

abstract class SnackbarUtils {
  static void showError(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppLightColors.system.error,
      icon: const Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
        size: 28,
      ),
      titleText: Text(
        title,
        style: AppTypography.body2Semibold.copyWith(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: AppTypography.footnote.copyWith(color: Colors.white),
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void showSuccess(String message, {String title = 'Success'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppLightColors.system.success,
      icon: const Icon(
        Icons.check_circle_outline_rounded,
        color: Colors.white,
        size: 28,
      ),
      titleText: Text(
        title,
        style: AppTypography.body2Semibold.copyWith(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: AppTypography.footnote.copyWith(color: Colors.white),
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void showWarning(String message, {String title = 'Warning'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppLightColors.system.warning,
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
        size: 28,
      ),
      titleText: Text(
        title,
        style: AppTypography.body2Semibold.copyWith(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: AppTypography.footnote.copyWith(color: Colors.white),
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
