//睡眠报告
import 'dart:convert';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/dimens.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../base/api/base_dio.dart';
import '../../../../../base/ui/app_mvvm.dart';
import '../../../../../base/utils/app_toast.dart';
import '../../../config/constant_main.dart';
import '../../../entity/smart_dev_event.dart';
import '../../../repository/remote/smart_dev_event_api.dart';
import '../../../repository/remote/smart_mqtt_api.dart';

class AlarmMainPage extends StatefulWidget {
  const AlarmMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AlarmMainState();
  }
}

class _AlarmMainState extends AppBaseState<AlarmMainPage, _AlarmMainVm>
    with AutomaticKeepAliveClientMixin {
  final String title = S.current.main_label_alarm;

  ///时间数字转值
  String _timeNumber2Str(String tileNumber) {
    if (tileNumber.length < 2) {
      tileNumber = "0$tileNumber";
    }
    return tileNumber;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (loginModel) => _AlarmMainVm(),
      builder: (context, child) {
        ThemeData themeData = Theme.of(context);
        registerEvent(context);
        var alarmMainVm = Provider.of<_AlarmMainVm>(context, listen: false);
        alarmMainVm.initVm();
        return Scaffold(
            appBar: AppBar(
              /*brightness: Brightness.dark,*/
              title: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              actions: [
                TextButton(
                    onPressed: () {
                      alarmMainVm.saveAlarm();
                    },
                    child: Text(S.current.action_save))
              ],
              //titleSpacing: 0,
            ),
            body: Consumer<_AlarmMainVm>(builder: (context, value, child) {
              //return Container(decoration: BoxDecoration(color: Colors.blue));
              return Center(
                  child: Column(
                children: [
                  Card(
                      margin: EdgeInsets.zero,
                      shadowColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(),
                      child: Ink(
                          child: InkWell(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SlcDimens.appDimens16),
                            child: Selector<_AlarmMainVm, bool>(
                                builder: (context, value, child) {
                              return Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(alarmMainVm.getAlarmSwitchText(),
                                          style:
                                              themeData.textTheme.titleLarge)),
                                  Switch(
                                      value: alarmMainVm.alarmSwitch,
                                      onChanged: (value) {
                                        alarmMainVm.setAlarmSwitch(value);
                                      })
                                ],
                              );
                            }, selector: (context, alarmMainVm) {
                              return alarmMainVm.alarmSwitch;
                            }, shouldRebuild: (previous, next) {
                              return previous != next;
                            })),
                        onTap: () => alarmMainVm
                            .setAlarmSwitch(!alarmMainVm.alarmSwitch),
                      ))),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Selector<_AlarmMainVm, int>(
                              builder: (context, value, child) {
                            return NumberPicker(
                              textStyle: TextStyle(
                                  fontSize: 48,
                                  color: themeData.colorScheme.onSurfaceVariant
                                      .withOpacity(0.8)),
                              selectedTextStyle: TextStyle(
                                  fontSize: 60,
                                  color: themeData.colorScheme.onSurface),
                              itemHeight: 80,
                              value: alarmMainVm.selectHour,
                              minValue: 0,
                              maxValue: 23,
                              onChanged: (value) {
                                alarmMainVm.setHour(value);
                              },
                              textMapper: _timeNumber2Str,
                            );
                          }, selector: (context, alarmMainVm) {
                            return alarmMainVm.selectHour;
                          }, shouldRebuild: (previous, next) {
                            return previous != next;
                          }),
                          const Text(":", style: TextStyle(fontSize: 60)),
                          Selector<_AlarmMainVm, int>(
                              builder: (context, value, child) {
                            return NumberPicker(
                              textStyle: TextStyle(
                                  fontSize: 48,
                                  color: themeData.colorScheme.onSurfaceVariant
                                      .withOpacity(0.8)),
                              selectedTextStyle: TextStyle(
                                  fontSize: 60,
                                  color: themeData.colorScheme.onSurface),
                              itemHeight: 80,
                              value: alarmMainVm.selectMinute,
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (value) {
                                alarmMainVm.setMinute(value);
                              },
                              textMapper: _timeNumber2Str,
                            );
                          }, selector: (context, alarmMainVm) {
                            return alarmMainVm.selectMinute;
                          }, shouldRebuild: (previous, next) {
                            return previous != next;
                          })
                        ],
                      ))
                ],
              ));
            }));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _AlarmMainVm extends AppBaseVm {
  List<String> hourList = List.generate(24, (index) => (index).toString());
  List<String> minuteList = List.generate(60, (index) => (index).toString());
  int selectHour = 0;
  int selectMinute = 0;
  bool alarmSwitch = false;

  void initVm() {
    SmartDevEventApiRepository.queryByTopic(
            ConstantMain.VALUE_TOPIC_EVENT_SET_ALARM)
        .then((value) {
      SmartDevEvent smartDevEvent = value.data;
      Map<String, dynamic> jsonMap = json.decode(smartDevEvent.message);
      selectHour = jsonMap["hour"]!;
      selectMinute = jsonMap["minute"]!;
      alarmSwitch = jsonMap["alarmSwitch"]!;
      notifyListeners();
    });
  }

  void setHour(int hour) {
    selectHour = hour;
    notifyListeners();
  }

  void setMinute(int minute) {
    selectMinute = minute;
    notifyListeners();
  }

  void setAlarmSwitch(bool alarmSwitch) {
    this.alarmSwitch = alarmSwitch;
    notifyListeners();
  }

  String getAlarmSwitchText() {
    return alarmSwitch
        ? S.current.main_label_alarm_open
        : S.current.main_label_alarm_close;
  }

  ///保存闹钟
  void saveAlarm() {
    Map<String, dynamic> msgMap = {};
    msgMap["hour"] = selectHour;
    msgMap["minute"] = selectMinute;
    msgMap["alarmSwitch"] = alarmSwitch;
    String msgJson = JsonUtil.encodeObj(msgMap)!;
    showLoading(title: S.current.label_submit_ing);
    SmartMqttApiRepository.sendMsg(
            SmartDevEvent(ConstantMain.VALUE_TOPIC_EVENT_SET_ALARM, msgJson))
        .then((value) {
      dismissLoading();
      AppToastBridge.showToast(msg: S.current.label_submitted_success);
    }, onError: (e) {
      dismissLoading();
      AppToastBridge.showToast(
          msg: BaseDio.getInstance()
              .getErrorMsg(e, defErrMsg: S.current.label_submitted_failure));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
