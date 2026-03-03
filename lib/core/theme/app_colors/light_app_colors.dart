import 'package:flutter/material.dart';

class AppColors {
  // ---------- Primary Palette ----------
  static const Color primary100 = Color(0xFF471AA0);
  static const Color primary200 = Color(0xFFBB84E8);

  // ---------- Grey Scale ----------
  static const Color grey900 = Color(0xFF011308);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey100 = Color(0xFFDFE1E7);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey0 = Color(0xFFFFFFFF);

  // ---------- Neutral ----------
  static const Color background = Color(0xFFFAFAFA);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // ---------- Status ----------
  static const Color error900 = Color(0xFF93000A);
  static const Color error700 = Color(0xFFDF1C41);
  static const Color error500 = Color(0xFFEF4444);
  static const Color warning500 = Color(0xFFF59E0B);


  // ---------- Gradients ----------
  static const List<Color> greenGradient = [
    Color(0xFF10B981),
    Color(0xFF16A34A),
  ];

  static const List<Color> orangeGradient = [
    Color(0xFFF59E0B),
    Color(0xFFEA580C),
  ];

  static const List<Color> yellowGradient = [
    Color(0xFFFCD34D),
    Color(0xFFEAB308),
  ];
  static List<Color> greenYellowGradient = [
    const Color(0xFF10B981).withValues(alpha: .1),
    const Color(0xFFF59E0B).withValues(alpha: .1),
  ];
}
