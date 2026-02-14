import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lask_news_app/features/welcome/widgets/welcome_background.dart';
import 'package:lask_news_app/features/welcome/widgets/welcome_content.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(children: [WelcomeBackground(), WelcomeContent()]),
      ),
    );
  }
}
