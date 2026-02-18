import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/auth/login/controllers/login_controller.dart';

class LoginFooter extends GetView<LoginController> {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColorsExtensions;
    final textStyles = context.appTextStyleExtensions;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: textStyles.body2.copyWith(
            color: colors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: controller.onSignUp,
          child: Text(
            'Sign Up',
            style: textStyles.body2Semibold.copyWith(
              color: colors.brandBlue,
            ),
          ),
        ),
      ],
    );
  }
}
