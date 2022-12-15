import 'package:flutter/material.dart';

class TTColors {
  static const primary = Color(0xFF10D4FF);
  static const secondary = Color(0xFF441CB7);
  static const blackSecondary = Color(0xFF130931);
  static const tertiary = Color(0xFFFCCB4F);

  static const bgVoilet = Color(0xFFF4F3F9);
  static const bgGrey = Color(0xFFF1F0F3);

  static Color greyLight = const Color(0xFF130931).withOpacity(.48);
  static Color greyLightZeroFour = const Color(0xFF130931).withOpacity(.04);
  static Color greyLightTwelve = const Color(0xFF130931).withOpacity(.12);
  static Color grey = const Color(0xFF130931).withOpacity(.64);
  static Color greyIcons = const Color(0xFF130931).withOpacity(.24);
  static Color divider = const Color(0xFF130931).withOpacity(.08);

  static const Color greyStroke = Color(0xFFF1F2F3);
  static const Color skeletonGradientBegin = Color(0xFFF9F9F9);
  static const Color skeletonGradientEnd = Color(0xFFE9E9E9);
  static LinearGradient skeletonGradient = const LinearGradient(
    colors: [skeletonGradientBegin, skeletonGradientEnd],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static const white = Colors.white;
}
