import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/app.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/network/dio_client.dart';
import 'package:lask_news_app/core/utils/storage_utils.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await StorageUtils.init();
  await dotenv.load();
  Get.put(DioClient());

  final authController = Get.put(AuthController());
  if (StorageUtils.hasKey("jwt")) {
    await authController.fetchCurrentUser();
  }

  FlutterNativeSplash.remove();

  runApp(const App());
}
