import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onSignIn() {}

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
