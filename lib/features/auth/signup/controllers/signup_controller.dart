import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/repositories/auth_repository.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/utils/snackbar_utils.dart';
import 'package:lask_news_app/core/utils/storage_utils.dart';

class SignupController extends GetxController {
  final _authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final isSubmitting = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void onSignUp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isSubmitting.value = true;

    try {
      final jwt = await _authRepository.signUp(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      SnackbarUtils.showSuccess(
        'Your account has been created. Welcome aboard!',
        title: 'Account Created',
      );

      await StorageUtils.write("jwt", jwt);
      await Get.find<AuthController>().fetchCurrentUser();
      Get.offAllNamed(AppRouteNames.home);
    } catch (e) {
      log("Error while signing up user: $e");
    } finally {
      isSubmitting.value = false;
    }
  }

  void onGoogleSignUp() {}

  void onAppleSignUp() {}

  void onSignIn() {
    Get.back();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
