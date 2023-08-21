import 'package:flutter/cupertino.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/dimens.dart';

class AppDimens extends SlcDimens {
  ///卡片外边距
  static final EdgeInsets cardMargin = EdgeInsets.symmetric(
      vertical: SlcDimens.appDimens8, horizontal: SlcDimens.appDimens12);
  ///卡片title外边距
  static final EdgeInsets cardTitleMargin = EdgeInsets.only(
      left: SlcDimens.appDimens16,
      right: SlcDimens.appDimens16,
      top: SlcDimens.appDimens8,
      bottom: SlcDimens.appDimens16);
}
