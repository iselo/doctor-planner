import 'package:flutter/cupertino.dart';

abstract class CupertinoAppTextStyle {
  static final double _letterSpacing = 0.4;

  static TextStyle get textStyle => TextStyle(
      fontSize: 16,
      letterSpacing: 0.4
  );

  static TextStyle get navLargeTitle => TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    letterSpacing: _letterSpacing,
  );

  static TextStyle get navTitle => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: _letterSpacing,
  );

  static TextStyle get tabLabel => TextStyle(
      fontSize: 12,
      letterSpacing: _letterSpacing
  );
}
