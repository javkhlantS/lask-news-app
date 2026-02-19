import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/repositories/auth_repository.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/utils/snackbar_utils.dart';
import 'package:lask_news_app/core/utils/storage_utils.dart';

class LoginController extends GetxController {
  final _authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;
  final isSubmitting = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onSignIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isSubmitting.value = true;

    try {
      final jwt = await _authRepository.login(
        email: emailController.text,
        password: passwordController.text,
      );

      SnackbarUtils.showSuccess(
        'Login is successfull. Welcome back!',
      );

      await StorageUtils.write("jwt", jwt);
      await Get.find<AuthController>().fetchCurrentUser();
      Get.offAllNamed(AppRouteNames.home);
    } catch (e) {
      log("Error while logging in user: $e");
    } finally {
      isSubmitting.value = false;
    }
  }

  void onForgotPassword() {}

  void onGoogleSignIn() {}

  void onAppleSignIn() {}

  void onSignUp() {
    Get.toNamed(AppRouteNames.signUp);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
