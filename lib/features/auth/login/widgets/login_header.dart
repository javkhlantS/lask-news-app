import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColorsExtensions;
    final textStyles = context.appTextStyleExtensions;

    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/logo-primary.png',
            height: 48,
          ),
        ),
        const SizedBox(height: 48),
        Text(
          'Welcome Back',
          style: textStyles.h3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in to continue reading the latest news',
          style: textStyles.body2.copyWith(color: colors.textSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
