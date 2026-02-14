import 'package:flutter/material.dart';
import 'package:lask_news_app/core/theme/constants/app_typography.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_text_style_extensions.g.theme.dart';

@ThemeExtensions()
class AppTextStyleExtensions extends ThemeExtension<AppTextStyleExtensions>
    with _$AppTextStyleExtensions {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle body1Semibold;
  final TextStyle body1;
  final TextStyle body2Semibold;
  final TextStyle body2;
  final TextStyle button1;
  final TextStyle button2;
  final TextStyle footnoteSemibold;
  final TextStyle footnote;

  const AppTextStyleExtensions({
    this.h1 = AppTypography.h1,
    this.h2 = AppTypography.h2,
    this.h3 = AppTypography.h3,
    this.h4 = AppTypography.h4,
    this.h5 = AppTypography.h5,
    this.body1Semibold = AppTypography.body1Semibold,
    this.body1 = AppTypography.body1,
    this.body2Semibold = AppTypography.body2Semibold,
    this.body2 = AppTypography.body2,
    this.button1 = AppTypography.button1,
    this.button2 = AppTypography.button2,
    this.footnoteSemibold = AppTypography.footnoteSemibold,
    this.footnote = AppTypography.footnote,
  });
}
