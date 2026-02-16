import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/constants/app_button_styles.dart';
import 'package:lask_news_app/core/theme/constants/app_dark_colors.dart';
import 'package:lask_news_app/core/theme/constants/app_light_colors.dart';
import 'package:lask_news_app/core/theme/constants/app_typography.dart';
import 'package:lask_news_app/core/theme/extensions/app_button_style_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_colors_extensions.dart';
import 'package:lask_news_app/core/theme/extensions/app_text_style_extensions.dart';

class AppTheme {
  static ThemeData light() {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: _lightTextStyles.body1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _lightButtonStyles.filledLarge,
      ),
      textButtonTheme: TextButtonThemeData(
        style: _lightButtonStyles.ghostLarge,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: _lightButtonStyles.filledIcon,
      ),
      scaffoldBackgroundColor: _lightColors.backgroundPrimary,
      appBarTheme: AppBarTheme(backgroundColor: _lightColors.brandBlue10),
      colorScheme: defaultTheme.colorScheme.copyWith(
        primary: _lightColors.brandBlue,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _lightColors.brandBlue,
        refreshBackgroundColor: _lightColors.brandBlue10,
      ),

      extensions: [_lightColors, _lightTextStyles, _lightButtonStyles],
    );
  }

  static ThemeData dark() {
    final defaultTheme = ThemeData.dark();
    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: _darkTextStyles.body1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _darkButtonStyles.filledLarge,
      ),
      textButtonTheme: TextButtonThemeData(style: _darkButtonStyles.ghostLarge),
      iconButtonTheme: IconButtonThemeData(style: _darkButtonStyles.filledIcon),
      scaffoldBackgroundColor: _darkColors.backgroundPrimary,
      appBarTheme: AppBarTheme(backgroundColor: _darkColors.brandBlue10),
      colorScheme: defaultTheme.colorScheme.copyWith(
        primary: _darkColors.brandBlue,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _darkColors.brandBlue,
        refreshBackgroundColor: _darkColors.brandBlue10,
      ),
      extensions: [_darkColors, _darkTextStyles, _darkButtonStyles],
    );
  }

  static final _lightColors = AppColorsExtensions(
    textPrimary: AppLightColors.text.primary,
    textSecondary: AppLightColors.text.secondary,
    textLink: AppLightColors.text.link,
    brandBlue: AppLightColors.brand.blue,
    brandBlue10: AppLightColors.brand.blue10,
    backgroundPrimary: AppLightColors.background.primary,
    backgroundSecondary: AppLightColors.background.secondary,
    backgroundBottomNav: AppLightColors.background.bottomNav,
    systemSuccess: AppLightColors.system.success,
    systemError: AppLightColors.system.error,
    systemWarning: AppLightColors.system.warning,
    systemInfo: AppLightColors.system.info,
    grey7: AppLightColors.grey.grey7,
    grey6: AppLightColors.grey.grey6,
    grey5: AppLightColors.grey.grey5,
    grey4: AppLightColors.grey.grey4,
    grey3: AppLightColors.grey.grey3,
    grey2: AppLightColors.grey.grey2,
    grey1: AppLightColors.grey.grey1,
    blue7: AppLightColors.blue.blue7,
    blue6: AppLightColors.blue.blue6,
    blue5: AppLightColors.blue.blue5,
    blue4: AppLightColors.blue.blue4,
    blue3: AppLightColors.blue.blue3,
    blue2: AppLightColors.blue.blue2,
    blue1: AppLightColors.blue.blue1,
    red7: AppLightColors.red.red7,
    red6: AppLightColors.red.red6,
    red5: AppLightColors.red.red5,
    red4: AppLightColors.red.red4,
    red3: AppLightColors.red.red3,
    red2: AppLightColors.red.red2,
    red1: AppLightColors.red.red1,
    green7: AppLightColors.green.green7,
    green6: AppLightColors.green.green6,
    green5: AppLightColors.green.green5,
    green4: AppLightColors.green.green4,
    green3: AppLightColors.green.green3,
    green2: AppLightColors.green.green2,
    green1: AppLightColors.green.green1,
    orange7: AppLightColors.orange.orange7,
    orange6: AppLightColors.orange.orange6,
    orange5: AppLightColors.orange.orange5,
    orange4: AppLightColors.orange.orange4,
    orange3: AppLightColors.orange.orange3,
    orange2: AppLightColors.orange.orange2,
    orange1: AppLightColors.orange.orange1,
  );

  static final _lightTextStyles = AppTextStyleExtensions(
    h1: AppTypography.h1.copyWith(color: AppLightColors.text.primary),
    h2: AppTypography.h2.copyWith(color: AppLightColors.text.primary),
    h3: AppTypography.h3.copyWith(color: AppLightColors.text.primary),
    h4: AppTypography.h4.copyWith(color: AppLightColors.text.primary),
    h5: AppTypography.h5.copyWith(color: AppLightColors.text.primary),
    body1Semibold: AppTypography.body1Semibold.copyWith(
      color: AppLightColors.text.primary,
    ),
    body1: AppTypography.body1.copyWith(color: AppLightColors.text.primary),
    body2Semibold: AppTypography.body2Semibold.copyWith(
      color: AppLightColors.text.primary,
    ),
    body2: AppTypography.body2.copyWith(color: AppLightColors.text.primary),
    button1: AppTypography.button1.copyWith(color: AppLightColors.text.primary),
    button2: AppTypography.button2.copyWith(color: AppLightColors.text.primary),
    footnoteSemibold: AppTypography.footnoteSemibold.copyWith(
      color: AppLightColors.text.primary,
    ),
    footnote: AppTypography.footnote.copyWith(
      color: AppLightColors.text.primary,
    ),
  );

  static final _darkTextStyles = AppTextStyleExtensions(
    h1: AppTypography.h1.copyWith(color: AppDarkColors.text.primary),
    h2: AppTypography.h2.copyWith(color: AppDarkColors.text.primary),
    h3: AppTypography.h3.copyWith(color: AppDarkColors.text.primary),
    h4: AppTypography.h4.copyWith(color: AppDarkColors.text.primary),
    h5: AppTypography.h5.copyWith(color: AppDarkColors.text.primary),
    body1Semibold: AppTypography.body1Semibold.copyWith(
      color: AppDarkColors.text.primary,
    ),
    body1: AppTypography.body1.copyWith(color: AppDarkColors.text.primary),
    body2Semibold: AppTypography.body2Semibold.copyWith(
      color: AppDarkColors.text.primary,
    ),
    body2: AppTypography.body2.copyWith(color: AppDarkColors.text.primary),
    button1: AppTypography.button1.copyWith(color: AppDarkColors.text.primary),
    button2: AppTypography.button2.copyWith(color: AppDarkColors.text.primary),
    footnoteSemibold: AppTypography.footnoteSemibold.copyWith(
      color: AppDarkColors.text.primary,
    ),
    footnote: AppTypography.footnote.copyWith(
      color: AppDarkColors.text.primary,
    ),
  );

  static final _darkColors = AppColorsExtensions(
    textPrimary: AppDarkColors.text.primary,
    textSecondary: AppDarkColors.text.secondary,
    textLink: AppDarkColors.text.link,
    brandBlue: AppDarkColors.brand.blue,
    brandBlue10: AppDarkColors.brand.blue10,
    backgroundPrimary: AppDarkColors.background.primary,
    backgroundSecondary: AppDarkColors.background.secondary,
    backgroundBottomNav: AppDarkColors.background.bottomNav,
    systemSuccess: AppDarkColors.system.success,
    systemError: AppDarkColors.system.error,
    systemWarning: AppDarkColors.system.warning,
    systemInfo: AppDarkColors.system.info,
    grey7: AppDarkColors.grey.grey7,
    grey6: AppDarkColors.grey.grey6,
    grey5: AppDarkColors.grey.grey5,
    grey4: AppDarkColors.grey.grey4,
    grey3: AppDarkColors.grey.grey3,
    grey2: AppDarkColors.grey.grey2,
    grey1: AppDarkColors.grey.grey1,
    blue7: AppDarkColors.blue.blue7,
    blue6: AppDarkColors.blue.blue6,
    blue5: AppDarkColors.blue.blue5,
    blue4: AppDarkColors.blue.blue4,
    blue3: AppDarkColors.blue.blue3,
    blue2: AppDarkColors.blue.blue2,
    blue1: AppDarkColors.blue.blue1,
    red7: AppDarkColors.red.red7,
    red6: AppDarkColors.red.red6,
    red5: AppDarkColors.red.red5,
    red4: AppDarkColors.red.red4,
    red3: AppDarkColors.red.red3,
    red2: AppDarkColors.red.red2,
    red1: AppDarkColors.red.red1,
    green7: AppDarkColors.green.green7,
    green6: AppDarkColors.green.green6,
    green5: AppDarkColors.green.green5,
    green4: AppDarkColors.green.green4,
    green3: AppDarkColors.green.green3,
    green2: AppDarkColors.green.green2,
    green1: AppDarkColors.green.green1,
    orange7: AppDarkColors.orange.orange7,
    orange6: AppDarkColors.orange.orange6,
    orange5: AppDarkColors.orange.orange5,
    orange4: AppDarkColors.orange.orange4,
    orange3: AppDarkColors.orange.orange3,
    orange2: AppDarkColors.orange.orange2,
    orange1: AppDarkColors.orange.orange1,
  );

  static final _lightButtonStyles = AppButtonStyleExtensions(
    filledLarge: AppButtonStyles.filledLarge,
    filledSmall: AppButtonStyles.filledSmall,
    outlinedLarge: AppButtonStyles.outlinedLarge,
    outlinedSmall: AppButtonStyles.outlinedSmall,
    secondaryLarge: AppButtonStyles.secondaryLarge,
    secondarySmall: AppButtonStyles.secondarySmall,
    ghostLarge: AppButtonStyles.ghostLarge,
    ghostSmall: AppButtonStyles.ghostSmall,
    filledIcon: AppButtonStyles.filledIcon,
    outlinedIcon: AppButtonStyles.outlinedIcon,
    secondaryIcon: AppButtonStyles.secondaryIcon,
    ghostIcon: AppButtonStyles.ghostIcon,
  );

  static final _darkButtonStyles = AppButtonStyleExtensions(
    filledLarge: AppButtonStyles.filledLarge,
    filledSmall: AppButtonStyles.filledSmall,
    outlinedLarge: AppButtonStyles.outlinedLarge,
    outlinedSmall: AppButtonStyles.outlinedSmall,
    secondaryLarge: AppButtonStyles.secondaryLarge,
    secondarySmall: AppButtonStyles.secondarySmall,
    ghostLarge: AppButtonStyles.ghostLarge,
    ghostSmall: AppButtonStyles.ghostSmall,
    filledIcon: AppButtonStyles.filledIcon,
    outlinedIcon: AppButtonStyles.outlinedIcon,
    secondaryIcon: AppButtonStyles.secondaryIcon,
    ghostIcon: AppButtonStyles.ghostIconDark,
  );
}
