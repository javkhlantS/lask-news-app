import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/core/utils/storage_utils.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  void markWelcomeAsRead() async {
    await StorageUtils.write("welcome_seen", true);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: MediaQuery.of(context).size.height * 0.50,
      child: Container(
        padding: EdgeInsets.only(
          left: 32,
          right: 32,
          top: 52,
          bottom: MediaQuery.of(context).padding.bottom + 0,
        ),
        decoration: BoxDecoration(
          color: context.appColorsExtensions.backgroundPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Get The Latest News And Updates",
              textAlign: TextAlign.center,
              style: context.appTextStyleExtensions.h3,
            ),
            const SizedBox(height: 16),
            Text(
              "From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Glob will be right on your hand.",
              textAlign: TextAlign.center,
              style: context.appTextStyleExtensions.body1.copyWith(
                color: context.appColorsExtensions.textSecondary,
                fontSize: 18,
                height: 26 / 18,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                markWelcomeAsRead();
                Get.offAllNamed(AppRouteNames.home);
              },
              label: const Text("Explore"),
              icon: const Icon(Icons.arrow_forward),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
