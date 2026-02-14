import 'package:flutter/material.dart';

abstract class AppTypography {
  static const h1 = TextStyle(
    fontFamily: "Inter",
    fontSize: 48,
    height: 50 / 48,
    fontWeight: FontWeight.w700,
  );

  static const h2 = TextStyle(
    fontFamily: "Inter",
    fontSize: 40,
    height: 48 / 40,
    fontWeight: FontWeight.w700,
  );

  static const h3 = TextStyle(
    fontFamily: "Inter",
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w600,
  );

  static const h4 = TextStyle(
    fontFamily: "Inter",
    fontSize: 24,
    height: 28 / 24,
    fontWeight: FontWeight.w600,
  );

  static const h5 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    height: 24 / 18,
    fontWeight: FontWeight.w600,
  );

  static const body1Semibold = TextStyle(
    fontFamily: "Merriweather",
    fontSize: 16,
    height: 26 / 16,
    fontWeight: FontWeight.w600,
  );

  static const body1 = TextStyle(
    fontFamily: "Merriweather",
    fontSize: 16,
    height: 30 / 16,
    fontWeight: FontWeight.w400,
  );

  static const body2Semibold = TextStyle(
    fontFamily: "Inter",
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
  );

  static const body2 = TextStyle(
    fontFamily: "Inter",
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.normal,
  );

  static const button1 = TextStyle(
    fontFamily: "Inter",
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w600,
  );

  static const button2 = TextStyle(
    fontFamily: "Inter",
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w600,
  );

  static const footnoteSemibold = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w600,
  );

  static const footnote = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    height: 18 / 12,
    fontWeight: FontWeight.w400,
  );
}
