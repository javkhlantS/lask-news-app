import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/auth/login/controllers/login_controller.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColorsExtensions;
    final textStyles = context.appTextStyleExtensions;
    final buttonStyles = context.appButtonStyleExtensions;

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
    final focusedInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: colors.brandBlue, width: 1.5),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Email', style: textStyles.body2Semibold),
        const SizedBox(height: 8),
        TextField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          style: textStyles.body2,
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: textStyles.body2.copyWith(color: colors.grey4),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: colors.grey5,
              size: 20,
            ),
            filled: true,
            fillColor: colors.backgroundSecondary,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: focusedInputBorder,
          ),
        ),
        const SizedBox(height: 20),
        Text('Password', style: textStyles.body2Semibold),
        const SizedBox(height: 8),
        Obx(
          () => TextField(
            controller: controller.passwordController,
            obscureText: controller.obscurePassword.value,
            style: textStyles.body2,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: textStyles.body2.copyWith(color: colors.grey4),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: colors.grey5,
                size: 20,
              ),
              suffixIcon: GestureDetector(
                onTap: controller.togglePasswordVisibility,
                child: Icon(
                  controller.obscurePassword.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: colors.grey5,
                  size: 20,
                ),
              ),
              filled: true,
              fillColor: colors.backgroundSecondary,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: focusedInputBorder,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: controller.onForgotPassword,
            style: buttonStyles.ghostSmall,
            child: Text(
              'Forgot Password?',
              style: textStyles.footnote.copyWith(color: colors.brandBlue),
            ),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: controller.onSignIn,
          style: buttonStyles.filledLarge,
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}
