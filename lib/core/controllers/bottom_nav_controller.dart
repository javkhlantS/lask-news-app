import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/features/bookmark/screens/bookmark_screen.dart';
import 'package:lask_news_app/features/explore/screens/explore_screen.dart';
import 'package:lask_news_app/features/home/screens/home_screen.dart';
import 'package:lask_news_app/features/profile/screens/profile_wrapper_screen.dart';

class BottomNavController extends GetxController {
  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const BookmarkScreen(),
    const ProfileWrapperScreen(),
  ];
  final items = [
    {"label": "Home", "icon": Icons.home_outlined},
    {"label": "Explore", "icon": Icons.explore_outlined},
    {"label": "Bookmark", "icon": Icons.bookmark_outline},
    {"label": "Profile", "icon": Icons.person_outline},
  ];

  final currentIndex = 0.obs;

  static const _bookmarkIndex = 2;
  static const _profileIndex = 3;

  void changePage(int index) {
    if (currentIndex.value == index) return;

    final isGuest = !Get.find<AuthController>().isLoggedIn;
    if (index == _bookmarkIndex && isGuest) {
      currentIndex.value = _profileIndex;
      return;
    }

    currentIndex.value = index;
  }
}
