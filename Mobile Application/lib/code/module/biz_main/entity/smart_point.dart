import 'package:json_annotation/json_annotation.dart';

part 'smart_point.g.dart';

@JsonSerializable()
class SmartPoint {
  int x;
  double y;
  String time;

  SmartPoint(this.x, this.y, this.time);

  factory SmartPoint.fromJson(Map<String, dynamic> json) =>
      _$SmartPointFromJson(json);

  Map<String, dynamic> toJson() => _$SmartPointToJson(this);
}
