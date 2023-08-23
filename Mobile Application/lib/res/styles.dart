import 'package:flutter/material.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/styles.dart';
import 'package:smart_sleep/res/colors.dart';

class AppStyles extends SlcStyles {
  //static final ThemeData appLightTheme = SlcStyles.appTheme.copyWith(scaffoldBackgroundColor: Colors.grey.shade100/*, useMaterial3: true*/);
  static final ThemeData appLightTheme = SlcStyles.appTheme.copyWith(colorScheme: AppColors.lightColorScheme);

}
