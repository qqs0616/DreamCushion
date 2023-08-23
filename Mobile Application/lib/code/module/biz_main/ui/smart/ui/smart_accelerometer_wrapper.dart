import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slc_boxes/flutter/slc/res/colors.dart';
import 'package:smart_sleep/code/module/biz_main/entity/smart_point.dart';

///加速度计
class SmartAccelerometerWrapper {
  ThemeData themeData;
  List<SmartPoint> xAxis;
  List<SmartPoint> yAxis;
  List<SmartPoint> zAxis;
  int xSize;

  List<String> bottomName = List.empty(growable: true);

  List<FlSpot> xAxisFlSpot = List.empty(growable: true);
  List<FlSpot> yAxisFlSpot = List.empty(growable: true);
  List<FlSpot> zAxisFlSpot = List.empty(growable: true);

  SmartAccelerometerWrapper(this.themeData, this.xAxis, this.yAxis, this.zAxis,
      this.xSize) {
    bottomName.clear();
    xAxisFlSpot.clear();
    yAxisFlSpot.clear();
    zAxisFlSpot.clear();
    int index = 0;
    for (var element in xAxis) {
      xAxisFlSpot.add(FlSpot(index.toDouble(), element.y + 90));
      bottomName.add(element.time);
      index++;
    }
    index = 0;
    for (var element in yAxis) {
      yAxisFlSpot.add(FlSpot(index.toDouble(), element.y + 90));
      index++;
    }
    index = 0;
    for (var element in zAxis) {
      zAxisFlSpot.add(FlSpot(index.toDouble(), element.y + 90));
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
      lineBarsData: getLineBarsData(xAxisFlSpot, yAxisFlSpot, zAxisFlSpot),
      minX: 0,
      maxX: xSize.toDouble(),
      maxY: 180,
      minY: 0,
    );
  }

  //触摸的提示
  LineTouchData getLineTouchData() {
    return LineTouchData(
      enabled:false,
      handleBuiltInTouches: true,
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
          interval: 45,
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
    if (value == meta.min) {
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

  List<LineChartBarData> getLineBarsData(
      List<FlSpot> xAxis, List<FlSpot> yAxis, List<FlSpot> zAxis) {
    return [
      getLineChartBarDataX(xAxis),
      getLineChartBarDataY(yAxis),
      getLineChartBarDataZ(zAxis),
    ];
  }

  LineChartBarData getLineChartBarDataX(List<FlSpot> dataList) {
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

  LineChartBarData getLineChartBarDataY(List<FlSpot> dataList) {
    return LineChartBarData(
      curveSmoothness: 0.12,
      isCurved: true,
      color: SlcColors.globalUiColorGreen1,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
      ),
      spots: dataList,
    );
  }

  LineChartBarData getLineChartBarDataZ(List<FlSpot> dataList) {
    return LineChartBarData(
      curveSmoothness: 0.12,
      isCurved: true,
      color: SlcColors.globalUiColorOrange1,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: dataList,
    );
  }
}
