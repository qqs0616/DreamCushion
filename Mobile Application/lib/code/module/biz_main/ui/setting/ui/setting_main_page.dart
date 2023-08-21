//睡眠报告
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/dimens.dart';
import 'package:provider/provider.dart';
import 'package:smart_sleep/code/base/ui/widget/fast_slc_ui_box.dart';
import 'package:smart_sleep/code/base/vm/global_vm.dart';
import 'package:smart_sleep/code/module/biz_main/ui/main/ui/main_page.dart';
import 'package:smart_sleep/code/module/mine/config/constant_user.dart';
import 'package:smart_sleep/res/dimens.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../base/ui/app_mvvm.dart';
import '../../../config/constant_main.dart';
import '../../../repository/local/sp_main_config.dart';

class SettingMainPage extends StatefulWidget {
  const SettingMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingMainState();
  }
}

class _SettingMainState extends AppBaseState<SettingMainPage, _SettingMainVm>
    with AutomaticKeepAliveClientMixin {
  final String title = S.current.main_label_setting;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (loginModel) => _SettingMainVm(),
      builder: (context, child) {
        ThemeData themeData = Theme.of(context);
        registerEvent(context);
        var _settingVm = Provider.of<_SettingMainVm>(context, listen: false);
        return Scaffold(
            appBar: AppBar(
              /*brightness: Brightness.dark,*/
              title: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              //titleSpacing: 0,
            ),
            body: Consumer<_SettingMainVm>(builder: (context, value, child) {
              return Column(children: [
                Padding(
                    padding: AppDimens.cardMargin,
                    child: Card(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: SlcDimens.appDimens16,
                                right: SlcDimens.appDimens16,
                                top: SlcDimens.appDimens16),
                            child: Row(children: [
                              Text(
                                  _settingVm.globalVm.userVmBox.userInfoOf.value
                                          ?.realName ??
                                      "",
                                  style: themeData.textTheme.headlineLarge),
                              const Expanded(
                                  flex: 1,
                                  child: Stack(
                                      alignment: AlignmentDirectional.centerEnd,
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                "assets/images/ic_launcher.png"),
                                            width: 48,
                                            height: 48)
                                      ]))
                            ])),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SlcDimens.appDimens16,
                                vertical: SlcDimens.appDimens16),
                            child: Text(
                                _settingVm.globalVm.userVmBox.userInfoOf.value
                                        ?.deptName ??
                                    "",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: themeData
                                        .colorScheme.onSurfaceVariant
                                        .withOpacity(0.8)))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SlcDimens.appDimens16),
                            child: SlcUiBoxStyleUtils.getDividerByBg(
                                color:
                                    themeData.dividerColor.withOpacity(0.4))),
                        Padding(
                            padding: EdgeInsets.all(SlcDimens.appDimens16)
                                .copyWith(top: SlcDimens.appDimens12),
                            child: Text(S.current.main_label_signature_no_setting,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: themeData
                                        .colorScheme.onSurfaceVariant
                                        .withOpacity(0.6)))),
                      ],
                    ))),
                Card(
                    margin: EdgeInsets.zero,
                    shadowColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(),
                    child: Ink(
                        child: InkWell(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SlcDimens.appDimens16),
                          child: Selector<_SettingMainVm, String>(
                              builder: (context, value, child) {
                            return Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        S.current.main_label_language_switching)),
                                Text(S.current.main_label_language_english),
                                Radio(
                                    value: ConstantMain.VALUE_LANGUAGE_CODE_EN,
                                    groupValue: _settingVm.currentLanguage,
                                    onChanged: (value) {
                                      _settingVm.setCurrentLanguage(value!);
                                    }),
                                Text(S.current.main_label_language_chinese),
                                Radio(
                                    value: ConstantMain.VALUE_LANGUAGE_CODE_ZH,
                                    groupValue: _settingVm.currentLanguage,
                                    onChanged: (value) {
                                      _settingVm.setCurrentLanguage(value!);
                                    })
                              ],
                            );
                          }, selector: (context, settingMainVm) {
                            return _settingVm.currentLanguage;
                          }, shouldRebuild: (previous, next) {
                            return previous != next;
                          })),
                    ))),
                Expanded(
                    flex: 1,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SlcDimens.appDimens16,
                              vertical: SlcDimens.appDimens16),
                          child: SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                  onPressed: () => _settingVm.onSignOut(),
                                  child: Text(S.current.user_label_sign_out)))),
                    ]))
              ]);
            }));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SettingMainVm extends AppBaseVm {
  GlobalVm globalVm = GlobalVm();
  String currentLanguage = SpMainConfig.getAppLanguage();

  void setCurrentLanguage(String languageCode) {
    currentLanguage = languageCode;
    if (languageCode == ConstantMain.VALUE_LANGUAGE_CODE_EN) {
      S.load(const Locale("en", ""));
    } else {
      S.load(const Locale("zh", "CN"));
    }
    SpMainConfig.saveAppLanguage(languageCode);
    startByPage(MainPage(), finish: true);
  }

  void onSignOut() {
    ConstantUser.logOut(this);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
