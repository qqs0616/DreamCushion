import 'dart:io';

import 'package:flustars_flutter3/flustars_flutter3.dart';

class SlcFileUtils {
  static const String VALUE_FILE_NAME_DATE_FORMAT = "_yyyyMMdd_HHmmss";

  ///
  /// 根据时间获取文件名
  ///
  static String getFileNameByTime(
      {String? prefix,
      int? ms,
      String dateFormat = VALUE_FILE_NAME_DATE_FORMAT,
      String? suffix,
      bool carryPathSeparator = true}) {
    if (ms == null) {
      ms = DateTime.now().millisecondsSinceEpoch;
    }
    return (carryPathSeparator ? Platform.pathSeparator : "") +
        (prefix ?? "") +
        DateUtil.formatDateMs(ms, format: dateFormat) +
        (suffix ?? "");
  }
}
