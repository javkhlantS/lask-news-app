import 'package:flutter/material.dart';

abstract class AppLightColors {
  static const text = _TextColors();
  static const brand = _BrandColors();
  static const background = _BackgroundColors();
  static const system = _SystemColors();
  static const grey = _GreyColors();
  static const blue = _BlueColors();
  static const red = _RedColors();
  static const green = _GreenColors();
  static const orange = _OrangeColors();
}

class _TextColors {
  const _TextColors();

  final primary = const Color(0xFF231F20);
  final secondary = const Color(0xFF6D6265);
  final link = const Color(0xFF0E0AB1);
}

class _BrandColors {
  const _BrandColors();

  final blue = const Color(0xFF2D5BD0);
  final blue10 = const Color(0xFFE9EEFA);
}

class _BackgroundColors {
  const _BackgroundColors();

  final primary = const Color(0xFFFFFFFF);
  final secondary = const Color(0xFFF3EBE9);
  final bottomNav = const Color(0xFFFCE9EE);
}

class _SystemColors {
  const _SystemColors();

  final success = const Color(0xFF0D942B);
  final error = const Color(0xFFE02607);
  final warning = const Color(0xFFFE4F32);
  final info = const Color(0xFF2D5BD0);
}

class _GreyColors {
  const _GreyColors();

  final grey7 = const Color(0xFF413B3D);
  final grey6 = const Color(0xFF6D6265);
  final grey5 = const Color(0xFF8A8184);
  final grey4 = const Color(0xFFA7A1A3);
  final grey3 = const Color(0xFFC5C0C1);
  final grey2 = const Color(0xFFE2E0E0);
  final grey1 = const Color(0xFFF0EFF0);
}

class _BlueColors {
  const _BlueColors();

  final blue7 = const Color(0xFF1B377D);
  final blue6 = const Color(0xFF2D5BD0);
  final blue5 = const Color(0xFF577CD9);
  final blue4 = const Color(0xFF819DE3);
  final blue3 = const Color(0xFFABBDEC);
  final blue2 = const Color(0xFFD5DEF6);
  final blue1 = const Color(0xFFEAEFFA);
}

class _RedColors {
  const _RedColors();

  final red7 = const Color(0xFF861704);
  final red6 = const Color(0xFFB31E06);
  final red5 = const Color(0xFFE02607);
  final red4 = const Color(0xFFE65139);
  final red3 = const Color(0xFFEC7D6A);
  final red2 = const Color(0xFFF3A89C);
  final red1 = const Color(0xFFF9D4CD);
}

class _GreenColors {
  const _GreenColors();

  final green7 = const Color(0xFF08591A);
  final green6 = const Color(0xFF0A7622);
  final green5 = const Color(0xFF0D942B);
  final green4 = const Color(0xFF57BD6D);
  final green3 = const Color(0xFF7BD18F);
  final green2 = const Color(0xFFA0E6B0);
  final green1 = const Color(0xFFB3F0C0);
}

class _OrangeColors {
  const _OrangeColors();

  final orange7 = const Color(0xFF9C301E);
  final orange6 = const Color(0xFFFE4F32);
  final orange5 = const Color(0xFFFE725B);
  final orange4 = const Color(0xFFFE9584);
  final orange3 = const Color(0xFFFFB9AD);
  final orange2 = const Color(0xFFFFCAC1);
  final orange1 = const Color(0xFFFFEDEA);
}
