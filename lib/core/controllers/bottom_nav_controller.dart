import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/features/auth/login/screens/login_screen.dart';
import 'package:lask_news_app/features/bookmark/screens/bookmark_screen.dart';
import 'package:lask_news_app/features/explore/screens/explore_screen.dart';
import 'package:lask_news_app/features/home/screens/home_screen.dart';

class BottomNavController extends GetxController {
  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const BookmarkScreen(),
    // const ProfileScreen(),
    const LoginScreen(),
  ];
  final items = [
    {"label": "Home", "icon": Icons.home_outlined},
    {"label": "Explore", "icon": Icons.explore_outlined},
    {"label": "Bookmark", "icon": Icons.bookmark_outline},
    {"label": "Profile", "icon": Icons.person_outline},
  ];

  final currentIndex = 0.obs;

  void changePage(int index) {
    if (currentIndex.value == index) return;
    currentIndex.value = index;
  }
}
