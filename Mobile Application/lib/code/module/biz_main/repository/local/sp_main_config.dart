import 'package:flustars_flutter3/flustars_flutter3.dart';

import '../../config/constant_main.dart';

class SpMainConfig {
  ///注：语言切换的配置放在此处不合适，应该放在代码的设置模块，此处暂时先放一下
  /// 是否使用中文
  static void saveAppLanguage(String value) {
    SpUtil.putString("appLanguage", value);
  }

  /// 是否使用中文
  static String getAppLanguage() {
    return SpUtil.getString("appLanguage", defValue: ConstantMain.VALUE_LANGUAGE_CODE_EN)!;
  }
}
