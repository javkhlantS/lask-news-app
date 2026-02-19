import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lask_news_app/core/controllers/auth_controller.dart';
import 'package:lask_news_app/core/routing/constants/app_route_names.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';
import 'package:lask_news_app/core/utils/storage_utils.dart';
import 'package:lask_news_app/features/profile/widgets/profile_appbar.dart';
import 'package:lask_news_app/features/profile/widgets/profile_header.dart';
import 'package:lask_news_app/features/profile/widgets/profile_menu_item.dart';
import 'package:lask_news_app/features/profile/widgets/profile_menu_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: context.appColorsExtensions.backgroundPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Logout',
          style: context.appTextStyleExtensions.h5,
        ),
        content: Text(
          'Are you sure you want to logout from your account?',
          style: context.appTextStyleExtensions.body2.copyWith(
            color: context.appColorsExtensions.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'Cancel',
              style: context.appTextStyleExtensions.button2.copyWith(
                color: context.appColorsExtensions.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(ctx).pop();
              await StorageUtils.remove('jwt');
              Get.find<AuthController>().clearUser();
              Get.offAllNamed(AppRouteNames.home);
            },
            child: Text(
              'Logout',
              style: context.appTextStyleExtensions.button2.copyWith(
                color: context.appColorsExtensions.systemError,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColorsExtensions.backgroundSecondary,
      appBar: const ProfileAppbar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 32,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            const SizedBox(height: 36),
            ProfileMenuSection(
              title: 'My Activity',
              items: [
                ProfileMenuItem(
                  icon: Icons.favorite_rounded,
                  title: 'Clapped Articles',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.menu_book_rounded,
                  title: 'Read Articles',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ProfileMenuSection(
              title: 'Account',
              items: [
                ProfileMenuItem(
                  icon: Icons.person_rounded,
                  title: 'My Account',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.logout_rounded,
                  title: 'Logout',
                  iconColor: context.appColorsExtensions.systemError,
                  titleColor: context.appColorsExtensions.systemError,
                  showChevron: false,
                  onTap: () => _showLogoutDialog(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
