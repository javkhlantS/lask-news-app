import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  String _getInitials(String username) {
    final parts = username.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty && parts[0].length >= 2) {
      return parts[0].substring(0, 2).toUpperCase();
    } else if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return 'U';
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Obx(() {
      final user = authController.currentUser.value;
      final username = user?.username ?? '';
      final email = user?.email ?? '';

      return Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: context.appColorsExtensions.brandBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      _getInitials(username),
                      style: context.appTextStyleExtensions.h3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: context.appColorsExtensions.backgroundPrimary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.appColorsExtensions.grey2,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 14,
                      color: context.appColorsExtensions.grey6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            username,
            style: context.appTextStyleExtensions.h5,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: context.appTextStyleExtensions.body2.copyWith(
              color: context.appColorsExtensions.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    });
  }
}
