//睡眠报告
import 'dart:math';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/colors.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/dimens.dart';
import 'package:provider/provider.dart';
import 'package:smart_sleep/code/base/ui/utils/date_select_utils.dart';
import 'package:smart_sleep/code/base/ui/widget/fast_slc_ui_box.dart';
import 'package:smart_sleep/code/module/biz_main/entity/smart_point.dart';
import 'package:smart_sleep/code/module/biz_main/ui/smart/ui/smart_accelerometer_wrapper.dart';
import 'package:smart_sleep/code/module/biz_main/ui/smart/ui/smart_humidity_wrapper.dart';
import 'package:smart_sleep/code/module/biz_main/ui/smart/ui/smart_pressure_wrapper.dart';
import 'package:smart_sleep/code/module/biz_main/ui/smart/ui/smart_sound_wrapper.dart';
import 'package:smart_sleep/code/module/biz_main/ui/smart/ui/smart_temperature_wrapper.dart';
import 'package:smart_sleep/res/dimens.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../base/api/base_dio.dart';
import '../../../../../base/config/constant_base.dart';
import '../../../../../base/ui/app_mvvm.dart';
import '../../../../../base/utils/app_toast.dart';
import '../../../entity/smart_dev_data_map.dart';
import '../../../repository/remote/smart_data_api.dart';

class SmartMainPage extends StatefulWidget {
  const SmartMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SmartMainState();
  }
}

class SmartMainState extends AppBaseState<SmartMainPage, _SmartMainVm>
    with AutomaticKeepAliveClientMixin {
  final String title = S.current.main_label_report;

  ///获取图标指示器
  Row getChartIndicator(Color color, String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(color: color, width: 40, height: 4),
      Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            text,
            style: const TextStyle(height: 1, fontSize: 12),
          ))
    ]);
  }

  Expanded getLeftWidget(double value) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
    return Expanded(
      flex: 1,
      child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
        Text("${value.toInt()}", style: style, textAlign: TextAlign.center)
      ]),
    );
  }

  Expanded getSoundLeftWidget(double value) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
    if (value == 0) {
      return Expanded(
        flex: 1,
        child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              Text("${value.toInt()}",
                  style: style, textAlign: TextAlign.center)
            ])),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Stack(alignment: AlignmentDirectional.topEnd, children: [
              Text("${value.toInt()}",
                  style: style, textAlign: TextAlign.center)
            ])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (loginModel) => _SmartMainVm(),
      builder: (context, child) {
        ThemeData themeData = Theme.of(context);
        registerEvent(context);
        final mainVm = Provider.of<_SmartMainVm>(context, listen: false);
        mainVm.initVm();
        return Scaffold(
            appBar: AppBar(
                /*brightness: Brightness.dark,*/
                title: Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                actions: [
                  TextButton(
                      onPressed: () {
                        DateSelectUtils.showDefaultYearPicker(context,
                                initialDate: mainVm.getCurrentDateTime())
                            .then((value) {
                          mainVm.setCurrentDateTime(value);
                        });
                      },
                      child: Selector<_SmartMainVm, String>(
                          builder: (context, value, child) {
                        return Text(value);
                      }, selector: (context, value) {
                        return value.getDateTime2Text();
                      }, shouldRebuild: (previous, next) {
                        return previous != next;
                      }))
                ]
                //titleSpacing: 0,
                ),
            //图标滚动使用固定大小来解决
            body: Consumer<_SmartMainVm>(builder: (context, value, child) {
              return /*EasyRefresh(
                header: const MaterialHeader(),
                onRefresh: () async {},
                canLoadAfterNoMore: true,
                child: Text("")
                ,
              )*/
                  Padding(
                      padding: AppDimens.cardMargin,
                      child: SingleChildScrollView(
                          child: Column(children: [
                        Card(
                            child: Column(children: [
                          Padding(
                              padding:
                                  AppDimens.cardTitleMargin.copyWith(bottom: 0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(S.current.main_label_accelerometer,
                                        style:
                                            themeData.textTheme.headlineSmall),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            getChartIndicator(
                                                SlcColors.globalUiColorBlue1,
                                                S.current.main_label_x_axis),
                                            getChartIndicator(
                                                SlcColors.globalUiColorGreen1,
                                                S.current.main_label_y_axis),
                                            getChartIndicator(
                                                SlcColors.globalUiColorOrange1,
                                                S.current.main_label_z_axis),
                                          ],
                                        ))
                                  ])),
                          SizedBox(
                              height: 256,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, left: 10),
                                        child: Column(children: [
                                          getLeftWidget(90),
                                          getLeftWidget(45),
                                          getLeftWidget(0),
                                          getLeftWidget(-45),
                                          getLeftWidget(-90)
                                        ])),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 32, top: 24, left: 8),
                                        child: SlcUiBoxStyleUtils
                                            .getVerticalDividerByBg(
                                                width: 2,
                                                thickness: 2,
                                                color: themeData
                                                    .colorScheme.primary
                                                    .withOpacity(0.2))),
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: SizedBox(
                                                    height: 232,
                                                    width: value
                                                            .accelerometerSize *
                                                        3,
                                                    child: LineChart(
                                                      SmartAccelerometerWrapper(
                                                              themeData,
                                                              value.xAxis,
                                                              value.yAxis,
                                                              value.zAxis,
                                                              value
                                                                  .accelerometerSize)
                                                          .getLineChartDate(),
                                                      duration: const Duration(
                                                          milliseconds: 250),
                                                    ),
                                                  ))
                                            ]))
                                  ]))
                        ])),
                        SlcUiBoxStyleUtils.getDividerByBg(
                            height: SlcDimens.appDimens8),
                        Card(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Padding(
                                  padding: AppDimens.cardTitleMargin,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(S.current.main_label_pressure,
                                            style: themeData
                                                .textTheme.headlineSmall),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                getChartIndicator(
                                                    SlcColors
                                                        .globalUiColorBlue1,
                                                    S.current.main_label_p_1),
                                                getChartIndicator(
                                                    SlcColors
                                                        .globalUiColorGreen1,
                                                    S.current.main_label_p_2),
                                                getChartIndicator(
                                                    SlcColors
                                                        .globalUiColorOrange1,
                                                    S.current.main_label_p_2),
                                                getChartIndicator(
                                                    SlcColors
                                                        .globalUiColorPurple1,
                                                    S.current.main_label_p_4),
                                              ],
                                            ))
                                      ])),
                              SizedBox(
                                  height: 256,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, left: 10),
                                            child: Column(children: [
                                              getLeftWidget(1024),
                                              getLeftWidget(768),
                                              getLeftWidget(512),
                                              getLeftWidget(256),
                                              getLeftWidget(0)
                                            ])),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 32, top: 24, left: 8),
                                            child: SlcUiBoxStyleUtils
                                                .getVerticalDividerByBg(
                                                    width: 2,
                                                    thickness: 2,
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withOpacity(0.2))),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: SizedBox(
                                                        height: 232,
                                                        width:
                                                            value.pressureSize *
                                                                3,
                                                        child: LineChart(
                                                          SmartPressureWrapper(
                                                                  themeData,
                                                                  value.p0,
                                                                  value.p1,
                                                                  value.p2,
                                                                  value.p3,
                                                                  value
                                                                      .pressureSize)
                                                              .getLineChartDate(),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      250),
                                                        ),
                                                      ))
                                                ]))
                                      ]))
                            ])),
                        SlcUiBoxStyleUtils.getDividerByBg(
                            height: SlcDimens.appDimens8),
                        Card(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Padding(
                                  padding: AppDimens.cardTitleMargin,
                                  child: Text(S.current.main_label_temperature,
                                      style:
                                          themeData.textTheme.headlineSmall)),
                              SizedBox(
                                  height: 256,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, left: 10),
                                            child: Column(children: [
                                              getLeftWidget(50),
                                              getLeftWidget(35),
                                              getLeftWidget(20),
                                              getLeftWidget(5),
                                              getLeftWidget(-10)
                                            ])),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 32, top: 24, left: 8),
                                            child: SlcUiBoxStyleUtils
                                                .getVerticalDividerByBg(
                                                    width: 2,
                                                    thickness: 2,
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withOpacity(0.2))),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: SizedBox(
                                                        height: 232,
                                                        width: value
                                                                .temperatureSize *
                                                            3,
                                                        child: LineChart(
                                                          SmartTemperatureWrapper(
                                                                  themeData,
                                                                  value
                                                                      .temperatureList,
                                                                  value
                                                                      .temperatureSize)
                                                              .getLineChartDate(),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      250),
                                                        ),
                                                      ))
                                                ]))
                                      ]))
                            ])),
                        SlcUiBoxStyleUtils.getDividerByBg(
                            height: SlcDimens.appDimens8),
                        Card(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Padding(
                                  padding: AppDimens.cardTitleMargin,
                                  child: Text(S.current.main_label_humidity,
                                      style:
                                          themeData.textTheme.headlineSmall)),
                              SizedBox(
                                  height: 256,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, left: 10),
                                            child: Column(children: [
                                              getLeftWidget(100),
                                              getLeftWidget(75),
                                              getLeftWidget(50),
                                              getLeftWidget(25),
                                              getLeftWidget(0)
                                            ])),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 32, top: 24, left: 8),
                                            child: SlcUiBoxStyleUtils
                                                .getVerticalDividerByBg(
                                                    width: 2,
                                                    thickness: 2,
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withOpacity(0.2))),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: SizedBox(
                                                        height: 232,
                                                        width:
                                                            value.humiditySize *
                                                                3,
                                                        child: LineChart(
                                                          SmartHumidityWrapper(
                                                                  themeData,
                                                                  value
                                                                      .humidityList,
                                                                  value
                                                                      .humiditySize)
                                                              .getLineChartDate(),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      250),
                                                        ),
                                                      ))
                                                ]))
                                      ]))
                            ])),
                        SlcUiBoxStyleUtils.getDividerByBg(
                            height: SlcDimens.appDimens8),
                        Card(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Padding(
                                  padding: AppDimens.cardTitleMargin,
                                  child: Text(S.current.main_label_sound,
                                      style:
                                          themeData.textTheme.headlineSmall)),
                              SizedBox(
                                  height: 256,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, left: 10),
                                            child: Column(children: [
                                              getSoundLeftWidget(1),
                                              getSoundLeftWidget(0)
                                            ])),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 32, top: 24, left: 8),
                                            child: SlcUiBoxStyleUtils
                                                .getVerticalDividerByBg(
                                                    width: 2,
                                                    thickness: 2,
                                                    color: themeData
                                                        .colorScheme.primary
                                                        .withOpacity(0.2))),
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: SizedBox(
                                                        height: 232,
                                                        width:
                                                            value.soundSize * 3,
                                                        child: LineChart(
                                                          SmartSoundWrapper(
                                                                  themeData,
                                                                  value
                                                                      .soundList,
                                                                  value
                                                                      .soundSize)
                                                              .getLineChartDate(),
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      250),
                                                        ),
                                                      ))
                                                ]))
                                      ]))
                            ])),
                      ])));
            }));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SmartMainVm extends AppBaseVm {
  DateTime _selectDateTime = DateTime.now();
  int accelerometerSize = 0;
  List<SmartPoint> xAxis = List.empty(growable: true);
  List<SmartPoint> yAxis = List.empty(growable: true);
  List<SmartPoint> zAxis = List.empty(growable: true);

  int pressureSize = 0;
  List<SmartPoint> p0 = List.empty(growable: true);
  List<SmartPoint> p1 = List.empty(growable: true);
  List<SmartPoint> p2 = List.empty(growable: true);
  List<SmartPoint> p3 = List.empty(growable: true);

  int soundSize = 0;
  List<SmartPoint> soundList = List.empty(growable: true);

  int temperatureSize = 0;
  List<SmartPoint> temperatureList = List.empty(growable: true);

  int humiditySize = 0;
  List<SmartPoint> humidityList = List.empty(growable: true);

  SmartDevDataMap? dataListByDate;

  void initVm() {
    Future.delayed(const Duration(milliseconds: 128))
        .then((value) => _getListByDate());
  }

  void _getListByDate() {
    showLoading(title: S.current.label_loading);
    SmartDataApiRepository.getListByDate2(getCurrentDateTime())
        .asStream()
        .map((event) {
          SmartDevDataMap smartDevDataMap = event.data;
          xAxis.clear();
          yAxis.clear();
          zAxis.clear();

          xAxis
              .addAll(smartDevDataMap.angleXList ?? List.empty(growable: true));
          yAxis
              .addAll(smartDevDataMap.angleYList ?? List.empty(growable: true));
          zAxis
              .addAll(smartDevDataMap.angleZList ?? List.empty(growable: true));
          accelerometerSize =
              max(xAxis.length, max(yAxis.length, zAxis.length));

          p0.clear();
          p1.clear();
          p2.clear();
          p3.clear();
          p0.addAll(smartDevDataMap.p0List ?? List.empty(growable: true));
          p1.addAll(smartDevDataMap.p1List ?? List.empty(growable: true));
          p2.addAll(smartDevDataMap.p2List ?? List.empty(growable: true));
          p3.addAll(smartDevDataMap.p3List ?? List.empty(growable: true));
          pressureSize = max(xAxis.length, max(yAxis.length, zAxis.length));

          soundList.clear();
          soundList
              .addAll(smartDevDataMap.soundList ?? List.empty(growable: true));
          soundSize = soundList.length;

          temperatureList.clear();
          temperatureList.addAll(
              smartDevDataMap.temperatureList ?? List.empty(growable: true));
          temperatureSize = temperatureList.length;

          humidityList.clear();
          humidityList.addAll(
              smartDevDataMap.humidityList ?? List.empty(growable: true));
          humiditySize = humidityList.length;
          return event;
        })
        .single
        .then((value) {
          dismissLoading();
          dataListByDate = value.data;
          notifyListeners();
        }, onError: (e) {
          dismissLoading();
          AppToastBridge.showToast(msg: BaseDio.getInstance().getErrorMsg(e));
        });

    /*SmartDataApiRepository.getListByDate(getCurrentDateTime()).asStream().map((
        event) {
      List<SmartDevDataEntity> smartDevDataEntityList = event.data;
      xAxis.clear();
      yAxis.clear();
      zAxis.clear();
      int index = 0;
      for (var element in smartDevDataEntityList) {
        xAxis.add(FlSpot(index.toDouble(), (element.angleX ?? -90)+90));
        yAxis.add(FlSpot(index.toDouble(), (element.angleY ?? -90)+90));
        zAxis.add(FlSpot(index.toDouble(), (element.angleZ ?? -90)+90));
        LogUtil.v(xAxis.last);
        LogUtil.v(yAxis.last);
        LogUtil.v(zAxis.last);
        if(index==3600){
          break;
        }
        index++;
      }
      return event;
    }).single
        .then((value) {
      dismissLoading();
      dataListByDate = value.data;
      notifyListeners();
    }, onError: (e) {
      dismissLoading();
      AppToastBridge.showToast(msg: BaseDio.getInstance().getErrorMsg(e));
    });*/
  }

  DateTime getCurrentDateTime() {
    return _selectDateTime;
  }

  void setCurrentDateTime(DateTime selectDateTime) {
    this._selectDateTime = selectDateTime;
    notifyListeners();
    _getListByDate();
  }

  String getDateTime2Text() {
    return DateUtil.formatDate(_selectDateTime,
        format: ConstantBase.VALUE_TIME_PATTERN_BY_Y_D_COMMON);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
