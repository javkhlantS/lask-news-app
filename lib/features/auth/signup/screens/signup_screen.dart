import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/features/auth/signup/controllers/signup_controller.dart';
import 'package:lask_news_app/features/auth/signup/widgets/signup_footer.dart';
import 'package:lask_news_app/features/auth/signup/widgets/signup_form.dart';
import 'package:lask_news_app/features/auth/signup/widgets/signup_header.dart';
import 'package:lask_news_app/features/auth/signup/widgets/signup_social_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      body: Stack(
        children: [
          const SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 48),
                  SignupHeader(),
                  SizedBox(height: 40),
                  SignupForm(),
                  SizedBox(height: 24),
                  SignupSocialButtons(),
                  SizedBox(height: 32),
                  SignupFooter(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Obx(
            () => controller.isSubmitting.value
                ? const ColoredBox(
                    color: Colors.black45,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
