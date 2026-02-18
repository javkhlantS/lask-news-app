import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/auth/signup/controllers/signup_controller.dart';

class SignupSocialButtons extends GetView<SignupController> {
  const SignupSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColorsExtensions;
    final textStyles = context.appTextStyleExtensions;

    final buttonStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 14),
      side: BorderSide(color: colors.grey2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: colors.grey2)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or continue with',
                style: textStyles.footnote.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
            Expanded(child: Divider(color: colors.grey2)),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: controller.onGoogleSignUp,
                style: buttonStyle,
                icon: Icon(
                  Icons.g_mobiledata,
                  size: 24,
                  color: colors.textPrimary,
                ),
                label: Text(
                  'Google',
                  style: textStyles.body2Semibold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: controller.onAppleSignUp,
                style: buttonStyle,
                icon: Icon(
                  Icons.apple,
                  size: 24,
                  color: colors.textPrimary,
                ),
                label: Text(
                  'Apple',
                  style: textStyles.body2Semibold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
