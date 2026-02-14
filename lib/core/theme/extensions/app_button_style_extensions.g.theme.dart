// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_button_style_extensions.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$AppButtonStyleExtensions on ThemeExtension<AppButtonStyleExtensions> {
  @override
  ThemeExtension<AppButtonStyleExtensions> copyWith({
    ButtonStyle? filledLarge,
    ButtonStyle? filledSmall,
    ButtonStyle? outlinedLarge,
    ButtonStyle? outlinedSmall,
    ButtonStyle? secondaryLarge,
    ButtonStyle? secondarySmall,
    ButtonStyle? ghostLarge,
    ButtonStyle? ghostSmall,
    ButtonStyle? filledIcon,
    ButtonStyle? outlinedIcon,
    ButtonStyle? secondaryIcon,
    ButtonStyle? ghostIcon,
  }) {
    final _this = (this as AppButtonStyleExtensions);

    return AppButtonStyleExtensions(
      filledLarge: filledLarge ?? _this.filledLarge,
      filledSmall: filledSmall ?? _this.filledSmall,
      outlinedLarge: outlinedLarge ?? _this.outlinedLarge,
      outlinedSmall: outlinedSmall ?? _this.outlinedSmall,
      secondaryLarge: secondaryLarge ?? _this.secondaryLarge,
      secondarySmall: secondarySmall ?? _this.secondarySmall,
      ghostLarge: ghostLarge ?? _this.ghostLarge,
      ghostSmall: ghostSmall ?? _this.ghostSmall,
      filledIcon: filledIcon ?? _this.filledIcon,
      outlinedIcon: outlinedIcon ?? _this.outlinedIcon,
      secondaryIcon: secondaryIcon ?? _this.secondaryIcon,
      ghostIcon: ghostIcon ?? _this.ghostIcon,
    );
  }

  @override
  ThemeExtension<AppButtonStyleExtensions> lerp(
    ThemeExtension<AppButtonStyleExtensions>? other,
    double t,
  ) {
    if (other is! AppButtonStyleExtensions) {
      return this;
    }

    final _this = (this as AppButtonStyleExtensions);

    return AppButtonStyleExtensions(
      filledLarge: ButtonStyle.lerp(_this.filledLarge, other.filledLarge, t)!,
      filledSmall: ButtonStyle.lerp(_this.filledSmall, other.filledSmall, t)!,
      outlinedLarge: ButtonStyle.lerp(
        _this.outlinedLarge,
        other.outlinedLarge,
        t,
      )!,
      outlinedSmall: ButtonStyle.lerp(
        _this.outlinedSmall,
        other.outlinedSmall,
        t,
      )!,
      secondaryLarge: ButtonStyle.lerp(
        _this.secondaryLarge,
        other.secondaryLarge,
        t,
      )!,
      secondarySmall: ButtonStyle.lerp(
        _this.secondarySmall,
        other.secondarySmall,
        t,
      )!,
      ghostLarge: ButtonStyle.lerp(_this.ghostLarge, other.ghostLarge, t)!,
      ghostSmall: ButtonStyle.lerp(_this.ghostSmall, other.ghostSmall, t)!,
      filledIcon: ButtonStyle.lerp(_this.filledIcon, other.filledIcon, t)!,
      outlinedIcon: ButtonStyle.lerp(
        _this.outlinedIcon,
        other.outlinedIcon,
        t,
      )!,
      secondaryIcon: ButtonStyle.lerp(
        _this.secondaryIcon,
        other.secondaryIcon,
        t,
      )!,
      ghostIcon: ButtonStyle.lerp(_this.ghostIcon, other.ghostIcon, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as AppButtonStyleExtensions);
    final _other = (other as AppButtonStyleExtensions);

    return _other.filledLarge == _this.filledLarge &&
        _other.filledSmall == _this.filledSmall &&
        _other.outlinedLarge == _this.outlinedLarge &&
        _other.outlinedSmall == _this.outlinedSmall &&
        _other.secondaryLarge == _this.secondaryLarge &&
        _other.secondarySmall == _this.secondarySmall &&
        _other.ghostLarge == _this.ghostLarge &&
        _other.ghostSmall == _this.ghostSmall &&
        _other.filledIcon == _this.filledIcon &&
        _other.outlinedIcon == _this.outlinedIcon &&
        _other.secondaryIcon == _this.secondaryIcon &&
        _other.ghostIcon == _this.ghostIcon;
  }

  @override
  int get hashCode {
    final _this = (this as AppButtonStyleExtensions);

    return Object.hash(
      runtimeType,
      _this.filledLarge,
      _this.filledSmall,
      _this.outlinedLarge,
      _this.outlinedSmall,
      _this.secondaryLarge,
      _this.secondarySmall,
      _this.ghostLarge,
      _this.ghostSmall,
      _this.filledIcon,
      _this.outlinedIcon,
      _this.secondaryIcon,
      _this.ghostIcon,
    );
  }
}

extension AppButtonStyleExtensionsBuildContext on BuildContext {
  AppButtonStyleExtensions get appButtonStyleExtensions =>
      Theme.of(this).extension<AppButtonStyleExtensions>()!;
}
