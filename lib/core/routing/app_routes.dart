import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/screens/bottom_nav_screen.dart';
import 'package:lask_news_app/features/articles/screens/artice_detail_screen.dart';
import 'package:lask_news_app/features/search/screens/search_result_screen.dart';
import 'package:lask_news_app/features/search/screens/search_screen.dart';
import 'package:lask_news_app/features/welcome/screens/welcome_screen.dart';

abstract class AppRoutes {
  static final routes = [
    GetPage(name: AppRouteNames.welcome, page: () => const WelcomeScreen()),
    GetPage(name: AppRouteNames.home, page: () => const BottomNavScreen()),
    GetPage(
      name: AppRouteNames.articleDetail,
      page: () => const ArticeDetailScreen(),
    ),
    GetPage(name: AppRouteNames.search, page: () => const SearchScreen()),
    GetPage(
      name: AppRouteNames.searchResult,
      page: () => const SearchResultScreen(),
    ),
  ];
}
