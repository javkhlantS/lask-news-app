import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/features/search/controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchScreenController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (value) => {
                    Get.offAndToNamed(AppRouteNames.searchResult),
                  },
                  controller: controller.textController,
                  autofocus: true,
                  autocorrect: false,
                  cursorHeight: 16,
                  cursorColor: context.appColorsExtensions.textPrimary,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: context.appColorsExtensions.textSecondary,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 22,
                    ),
                    suffixIcon: Obx(
                      () => controller.hasText.value
                          ? GestureDetector(
                              onTap: controller.clearText,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.cancel,
                                  size: 14,
                                  color:
                                      context.appColorsExtensions.textSecondary,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 18,
                    ),
                    filled: true,
                    fillColor: context.appColorsExtensions.grey1,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 12,
                    ),
                    labelStyle: context.appTextStyleExtensions.body1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF577CD9)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                style: context.appButtonStyleExtensions.ghostSmall,
                child: const Text("Cancel"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
