// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_dev_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartDevEvent _$SmartDevEventFromJson(Map<String, dynamic> json) =>
    SmartDevEvent(
      json['topic'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$SmartDevEventToJson(SmartDevEvent instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'message': instance.message,
    };
