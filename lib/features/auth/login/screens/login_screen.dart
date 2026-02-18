import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/features/auth/login/controllers/login_controller.dart';
import 'package:lask_news_app/features/auth/login/widgets/login_footer.dart';
import 'package:lask_news_app/features/auth/login/widgets/login_form.dart';
import 'package:lask_news_app/features/auth/login/widgets/login_header.dart';
import 'package:lask_news_app/features/auth/login/widgets/login_social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 48),
              LoginHeader(),
              SizedBox(height: 40),
              LoginForm(),
              SizedBox(height: 24),
              LoginSocialButtons(),
              SizedBox(height: 32),
              LoginFooter(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
