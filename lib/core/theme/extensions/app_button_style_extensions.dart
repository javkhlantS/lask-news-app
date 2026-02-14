import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'app_button_style_extensions.g.theme.dart';

@ThemeExtensions()
class AppButtonStyleExtensions extends ThemeExtension<AppButtonStyleExtensions>
    with _$AppButtonStyleExtensions {
  final ButtonStyle filledLarge;
  final ButtonStyle filledSmall;
  final ButtonStyle outlinedLarge;
  final ButtonStyle outlinedSmall;
  final ButtonStyle secondaryLarge;
  final ButtonStyle secondarySmall;
  final ButtonStyle ghostLarge;
  final ButtonStyle ghostSmall;
  final ButtonStyle filledIcon;
  final ButtonStyle outlinedIcon;
  final ButtonStyle secondaryIcon;
  final ButtonStyle ghostIcon;

  const AppButtonStyleExtensions({
    required this.filledLarge,
    required this.filledSmall,
    required this.outlinedLarge,
    required this.outlinedSmall,
    required this.secondaryLarge,
    required this.secondarySmall,
    required this.ghostLarge,
    required this.ghostSmall,
    required this.filledIcon,
    required this.outlinedIcon,
    required this.secondaryIcon,
    required this.ghostIcon,
  });
}
