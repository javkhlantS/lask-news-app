// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_text_style_extensions.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$AppTextStyleExtensions on ThemeExtension<AppTextStyleExtensions> {
  @override
  ThemeExtension<AppTextStyleExtensions> copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? body1Semibold,
    TextStyle? body1,
    TextStyle? body2Semibold,
    TextStyle? body2,
    TextStyle? button1,
    TextStyle? button2,
    TextStyle? footnoteSemibold,
    TextStyle? footnote,
  }) {
    final _this = (this as AppTextStyleExtensions);

    return AppTextStyleExtensions(
      h1: h1 ?? _this.h1,
      h2: h2 ?? _this.h2,
      h3: h3 ?? _this.h3,
      h4: h4 ?? _this.h4,
      h5: h5 ?? _this.h5,
      body1Semibold: body1Semibold ?? _this.body1Semibold,
      body1: body1 ?? _this.body1,
      body2Semibold: body2Semibold ?? _this.body2Semibold,
      body2: body2 ?? _this.body2,
      button1: button1 ?? _this.button1,
      button2: button2 ?? _this.button2,
      footnoteSemibold: footnoteSemibold ?? _this.footnoteSemibold,
      footnote: footnote ?? _this.footnote,
    );
  }

  @override
  ThemeExtension<AppTextStyleExtensions> lerp(
    ThemeExtension<AppTextStyleExtensions>? other,
    double t,
  ) {
    if (other is! AppTextStyleExtensions) {
      return this;
    }

    final _this = (this as AppTextStyleExtensions);

    return AppTextStyleExtensions(
      h1: TextStyle.lerp(_this.h1, other.h1, t)!,
      h2: TextStyle.lerp(_this.h2, other.h2, t)!,
      h3: TextStyle.lerp(_this.h3, other.h3, t)!,
      h4: TextStyle.lerp(_this.h4, other.h4, t)!,
      h5: TextStyle.lerp(_this.h5, other.h5, t)!,
      body1Semibold: TextStyle.lerp(
        _this.body1Semibold,
        other.body1Semibold,
        t,
      )!,
      body1: TextStyle.lerp(_this.body1, other.body1, t)!,
      body2Semibold: TextStyle.lerp(
        _this.body2Semibold,
        other.body2Semibold,
        t,
      )!,
      body2: TextStyle.lerp(_this.body2, other.body2, t)!,
      button1: TextStyle.lerp(_this.button1, other.button1, t)!,
      button2: TextStyle.lerp(_this.button2, other.button2, t)!,
      footnoteSemibold: TextStyle.lerp(
        _this.footnoteSemibold,
        other.footnoteSemibold,
        t,
      )!,
      footnote: TextStyle.lerp(_this.footnote, other.footnote, t)!,
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

    final _this = (this as AppTextStyleExtensions);
    final _other = (other as AppTextStyleExtensions);

    return _other.h1 == _this.h1 &&
        _other.h2 == _this.h2 &&
        _other.h3 == _this.h3 &&
        _other.h4 == _this.h4 &&
        _other.h5 == _this.h5 &&
        _other.body1Semibold == _this.body1Semibold &&
        _other.body1 == _this.body1 &&
        _other.body2Semibold == _this.body2Semibold &&
        _other.body2 == _this.body2 &&
        _other.button1 == _this.button1 &&
        _other.button2 == _this.button2 &&
        _other.footnoteSemibold == _this.footnoteSemibold &&
        _other.footnote == _this.footnote;
  }

  @override
  int get hashCode {
    final _this = (this as AppTextStyleExtensions);

    return Object.hash(
      runtimeType,
      _this.h1,
      _this.h2,
      _this.h3,
      _this.h4,
      _this.h5,
      _this.body1Semibold,
      _this.body1,
      _this.body2Semibold,
      _this.body2,
      _this.button1,
      _this.button2,
      _this.footnoteSemibold,
      _this.footnote,
    );
  }
}

extension AppTextStyleExtensionsBuildContext on BuildContext {
  AppTextStyleExtensions get appTextStyleExtensions =>
      Theme.of(this).extension<AppTextStyleExtensions>()!;
}
