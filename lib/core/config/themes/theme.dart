import 'package:flutter/material.dart';

class FontStyles {
  static const double _formTextSize = 32.0;
  static const double _titleFontSize = 20;
  static const double _bigFontSize = 18;
  static const double _largeFontSize = 16;
  static const double _mediumFontSize = 14;
  static const double _smallFontSize = 12;

  static const TextStyle formFontSize = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _formTextSize,
  );

  static const TextStyle largeTitleFontSize = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: _titleFontSize,
  );

  static const TextStyle mediumTitleFontSize = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: _bigFontSize,
  );

  static const TextStyle bodyInfo = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _bigFontSize,
  );

  static const TextStyle subtitleTitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: _largeFontSize,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _largeFontSize,
  );

  static const TextStyle bodyBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _mediumFontSize,
  );
  static const TextStyle bodyText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _mediumFontSize,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: _mediumFontSize,
  );
  static const TextStyle captionBold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _smallFontSize,
  );
  static const TextStyle captionMedium = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: _smallFontSize,
  );
}
