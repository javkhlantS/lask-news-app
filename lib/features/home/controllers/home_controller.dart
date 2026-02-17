import 'dart:developer';

import 'package:get/get.dart';
import 'package:lask_news_app/core/models/home.dart';
import 'package:lask_news_app/core/repositories/home_repository.dart';

class HomeController extends GetxController {
  final _homeRepository = HomeRepository();

  final homeData = Rxn<Home>();
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHome();
  }

  Future<void> fetchHome() async {
    isLoading.value = true;

    try {
      homeData.value = await _homeRepository.getHome();
    } catch (e) {
      log("Failed to fetch home data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
