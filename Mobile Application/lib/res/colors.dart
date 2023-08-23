import 'package:flutter/material.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/colors.dart';

class AppColors extends SlcColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF9C4048),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFDADA),
    onPrimaryContainer: Color(0xFF40000B),
    secondary: Color(0xFF3F6918),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFBFF190),
    onSecondaryContainer: Color(0xFF0D2000),
    tertiary: Color(0xFF76592F),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDDB1),
    onTertiaryContainer: Color(0xFF291800),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF201A1A),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF201A1A),
    surfaceVariant: Color(0xFFF4DDDD),
    onSurfaceVariant: Color(0xFF524343),
    outline: Color(0xFF857373),
    onInverseSurface: Color(0xFFFBEEED),
    inverseSurface: Color(0xFF362F2F),
    inversePrimary: Color(0xFFFFB3B5),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF9C4048),
    outlineVariant: Color(0xFFD7C1C1),
    scrim: Color(0xFF000000),
  );
}
