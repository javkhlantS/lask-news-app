import 'package:flutter/material.dart';

abstract class AppDarkColors {
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

  final primary = const Color(0xFFE0DCDD);
  final secondary = const Color(0xFF6D6265);
  final link = const Color(0xFF96ADE7);
}

class _BrandColors {
  const _BrandColors();

  final blue = const Color(0xFF416BD6);
  final blue10 = const Color(0xFF1A1A1A);
}

class _BackgroundColors {
  const _BackgroundColors();

  final primary = const Color(0xFF0D0D0D);
  final secondary = const Color(0xFF261815);
  final bottomNav = const Color(0xFF1A1A1A);
}

class _SystemColors {
  const _SystemColors();

  final success = const Color(0xFF0FAB31);
  final error = const Color(0xFFF72E0A);
  final warning = const Color(0xFFFE664B);
  final info = const Color(0xFF416BD6);
}

class _GreyColors {
  const _GreyColors();

  final grey7 = const Color(0xFF413B3D);
  final grey6 = const Color(0xFF6D6265);
  final grey5 = const Color(0xFF8A8184);
  final grey4 = const Color(0xFFA7A1A3);
  final grey3 = const Color(0xFFC5C0C1);
  final grey2 = const Color(0xFF3A3637);
  final grey1 = const Color(0xFF292929);
}

class _BlueColors {
  const _BlueColors();

  final blue7 = const Color(0xFF204092);
  final blue6 = const Color(0xFF416BD6);
  final blue5 = const Color(0xFF6C8CDE);
  final blue4 = const Color(0xFF96ADE7);
  final blue3 = const Color(0xFFABBDEC);
  final blue2 = const Color(0xFF0E1C3F);
  final blue1 = const Color(0xFF1A1A1A);
}

class _RedColors {
  const _RedColors();

  final red7 = const Color(0xFF9F1C05);
  final red6 = const Color(0xFFCC2406);
  final red5 = const Color(0xFFF72E0A);
  final red4 = const Color(0xFFE9664F);
  final red3 = const Color(0xFFEF9181);
  final red2 = const Color(0xFFF3A99C);
  final red1 = const Color(0xFF481309);
}

class _GreenColors {
  const _GreenColors();

  final green7 = const Color(0xFFA6F7B8);
  final green6 = const Color(0xFF0C8E28);
  final green5 = const Color(0xFF0FAB31);
  final green4 = const Color(0xFF69C47D);
  final green3 = const Color(0xFF8ED89E);
  final green2 = const Color(0xFFA0E6AF);
  final green1 = const Color(0xFF136226);
}

class _OrangeColors {
  const _OrangeColors();

  final orange7 = const Color(0xFFB13822);
  final orange6 = const Color(0xFFFE664B);
  final orange5 = const Color(0xFFFE8974);
  final orange4 = const Color(0xFFFE9684);
  final orange3 = const Color(0xFF6B1101);
  final orange2 = const Color(0xFF570D00);
  final orange1 = const Color(0xFF171717);
}
