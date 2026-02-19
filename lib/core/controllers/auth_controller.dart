import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/models/user.dart';
import 'package:lask_news_app/core/repositories/user_repository.dart';

class AuthController extends GetxController {
  final _userRepository = UserRepository();

  final Rx<User?> currentUser = Rx<User?>(null);

  bool get isLoggedIn => currentUser.value != null;

  Future<void> fetchCurrentUser() async {
    log("Current user working");
    try {
      final user = await _userRepository.getMe();
      currentUser.value = user;
    } catch (e) {
      log("Error fetching current user: $e");
      currentUser.value = null;
    }
  }

  void setUser(User user) {
    currentUser.value = user;
  }

  void clearUser() {
    currentUser.value = null;
  }
}
