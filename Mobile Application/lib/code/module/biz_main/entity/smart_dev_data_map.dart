import 'package:json_annotation/json_annotation.dart';
import 'package:smart_sleep/code/module/biz_main/entity/smart_point.dart';

part 'smart_dev_data_map.g.dart';

@JsonSerializable()
class SmartDevDataMap {
  //angleXList
  List<SmartPoint>? angleXList;

  //angleYList
  List<SmartPoint>? angleYList;

  //angleZList
  List<SmartPoint>? angleZList;

  //p0List
  List<SmartPoint>? p0List;

  //p1List
  List<SmartPoint>? p1List;

  //p2List
  List<SmartPoint>? p2List;

  //p3List
  List<SmartPoint>? p3List;

  //temperatureList
  List<SmartPoint>? temperatureList;

  //humidityList
  List<SmartPoint>? humidityList;

  //soundList
  List<SmartPoint>? soundList;

  SmartDevDataMap(this.angleXList,
    this.angleYList,
    this.angleZList,
    this.p0List,
    this.p1List,
    this.p2List,
    this.p3List,
    this.temperatureList,
    this.humidityList,
    this.soundList);

  factory SmartDevDataMap.fromJson(Map<String, dynamic> json){
    return _$SmartDevDataMapFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SmartDevDataMapToJson(this);
}
