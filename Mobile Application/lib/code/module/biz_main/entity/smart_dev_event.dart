import 'package:json_annotation/json_annotation.dart';

part 'smart_dev_event.g.dart';
@JsonSerializable()
class SmartDevEvent {
  String topic;
  String message;

  SmartDevEvent(this.topic, this.message);


  factory SmartDevEvent.fromJson(Map<String, dynamic> json) =>
      _$SmartDevEventFromJson(json);

  Map<String, dynamic> toJson() => _$SmartDevEventToJson(this);
}
