import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/colors.dart';

import '../../../entity/smart_point.dart';

///温度
class SmartTemperatureWrapper {
  ThemeData themeData;
  List<SmartPoint> dateList;
  int xSize;

  List<String> bottomName = List.empty(growable: true);

  List<FlSpot> dateListFlSpot = List.empty(growable: true);

  SmartTemperatureWrapper(this.themeData, this.dateList, this.xSize) {
    bottomName.clear();
    dateListFlSpot.clear();
    int index = 0;
    for (var element in dateList) {
      dateListFlSpot.add(FlSpot(index.toDouble(), element.y + 10));
      bottomName.add(element.time);
      index++;
    }
  }

  //数据
  LineChartData getLineChartDate() {
    return LineChartData(
      lineTouchData: getLineTouchData(),
      gridData: getGridData(),
      titlesData: getTitlesData(),
      borderData: getBorderData(themeData),
      lineBarsData: getLineBarsData(),
      minX: 0,
      maxX: xSize.toDouble(),
      maxY: 60,
      minY: 0,
    );
  }

  //触摸的提示
  LineTouchData getLineTouchData() {
    return LineTouchData(
      enabled:false,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      getTouchedSpotIndicator: getTouchedIndicators,
    );
  }

  ///barData是线条，indicators里面的值表示横行的第几个，但是不清楚为什么是数组，暂时没搞懂
  List<TouchedSpotIndicatorData> getTouchedIndicators(
      LineChartBarData barData, List<int> indicators) {
    return defaultTouchedIndicators(barData, indicators);
  }

  //网格线
  FlGridData getGridData() {
    return const FlGridData(show: false);
  }

  //提示信息
  FlTitlesData getTitlesData() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        //底部title
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 32,
          interval: 30,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          getTitlesWidget: leftTitleWidgets,
          showTitles: true,
          interval: 12,
          reservedSize: 0,
        ),
      ),
    );
  }

  //底部信息控件
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    if (value == 0) {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 1,
      child: Text(
          bottomName[
          value.toInt() == meta.max ? value.toInt() - 1 : value.toInt()],
          style: style),
    );
  }

  //左边标题控件
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return Container();
    /*const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    if (value % 3 != 0) {
      return Container();
    }
    return Text("${value.toInt()}", style: style, textAlign: TextAlign.center);*/
  }

  //边界
  FlBorderData getBorderData(ThemeData themeData) {
    return FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(
            color: themeData.colorScheme.primary.withOpacity(0.2), width: 2),
        left: const BorderSide(color: Colors.transparent, width: 0),
        right: const BorderSide(color: Colors.transparent),
        top: const BorderSide(color: Colors.transparent),
      ),
    );
  }

  List<LineChartBarData> getLineBarsData() {
    return [
      getLineChartBarData(dateListFlSpot),
    ];
  }

  LineChartBarData getLineChartBarData(List<FlSpot> dataList) {
    return LineChartBarData(
      curveSmoothness: 0.12,
      isCurved: true,
      color: SlcColors.globalUiColorBlue1,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: dataList,
    );
  }
}
