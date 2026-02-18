import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/auth/signup/controllers/signup_controller.dart';

class SignupForm extends GetView<SignupController> {
  const SignupForm({super.key});

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
    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.red, width: 1.5),
    );

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Username', style: textStyles.body2Semibold),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.usernameController,
            keyboardType: TextInputType.text,
            style: textStyles.body2,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Username is required';
              }
              if (value.trim().length < 3) {
                return 'Username must be at least 3 characters';
              }
              if (value.contains(' ')) {
                return 'Username cannot contain spaces';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter your username',
              hintStyle: textStyles.body2.copyWith(color: colors.grey4),
              prefixIcon: Icon(
                Icons.person_outline,
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
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
            ),
          ),
          const SizedBox(height: 20),
          Text('Email', style: textStyles.body2Semibold),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            style: textStyles.body2,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              }
              if (!GetUtils.isEmail(value.trim())) {
                return 'Enter a valid email address';
              }
              return null;
            },
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
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
            ),
          ),
          const SizedBox(height: 20),
          Text('Password', style: textStyles.body2Semibold),
          const SizedBox(height: 8),
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              obscureText: controller.obscurePassword.value,
              style: textStyles.body2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
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
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Confirm Password', style: textStyles.body2Semibold),
          const SizedBox(height: 8),
          Obx(
            () => TextFormField(
              controller: controller.confirmPasswordController,
              obscureText: controller.obscureConfirmPassword.value,
              style: textStyles.body2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != controller.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Re-enter your password',
                hintStyle: textStyles.body2.copyWith(color: colors.grey4),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: colors.grey5,
                  size: 20,
                ),
                suffixIcon: GestureDetector(
                  onTap: controller.toggleConfirmPasswordVisibility,
                  child: Icon(
                    controller.obscureConfirmPassword.value
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
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: controller.onSignUp,
            style: buttonStyles.filledLarge,
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
