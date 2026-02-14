import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lask_news_app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const App());
}
