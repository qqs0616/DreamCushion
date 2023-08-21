import 'package:json_annotation/json_annotation.dart';

part 'smart_dev_data_entity.g.dart';

@JsonSerializable()
class SmartDevDataEntity {
  //ID
  String? id;

  //客户端ID
  String? devId;

  //主题
  String? topic;

  //qos
  int? qos;

  //X轴角度
  double? angleX;

  //Y轴角度
  double? angleY;

  //Z轴角度
  double? angleZ;

  //温度
  double? temperature;

  //湿度
  double? humidity;

  //压力0
  double? p0;

  //压力1
  double? p1;

  //压力2
  double? p2;

  //压力3
  double? p3;

  //声音
  double? sound;

  //创建时间
  String? createTime;

  SmartDevDataEntity(
      {this.id,
      this.devId,
      this.topic,
      this.qos,
      this.angleX,
      this.angleY,
      this.angleZ,
      this.temperature,
      this.humidity,
      this.p0,
      this.p1,
      this.p2,
      this.p3,
      this.sound,
      this.createTime});

  static List<SmartDevDataEntity> fromJsonArray(List<dynamic> jsonArray) {
    List<SmartDevDataEntity> smartDevDataEntityList =
        List.empty(growable: true);
    for (var element in jsonArray) {
      smartDevDataEntityList.add(SmartDevDataEntity.fromJson(element));
    }
    return smartDevDataEntityList;
  }

  factory SmartDevDataEntity.fromJson(Map<String, dynamic> json) =>
      _$SmartDevDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SmartDevDataEntityToJson(this);
}
