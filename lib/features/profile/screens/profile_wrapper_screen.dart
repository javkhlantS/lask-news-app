import 'package:flutter/material.dart';
import 'package:lask_news_app/core/utils/storage_utils.dart';
import 'package:lask_news_app/features/auth/login/screens/login_screen.dart';
import 'package:lask_news_app/features/profile/screens/profile_screen.dart';

class ProfileWrapperScreen extends StatelessWidget {
  const ProfileWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jwt = StorageUtils.read("jwt");
    if (jwt == null) {
      return const LoginScreen();
    }

    return const ProfileScreen();
  }
}
