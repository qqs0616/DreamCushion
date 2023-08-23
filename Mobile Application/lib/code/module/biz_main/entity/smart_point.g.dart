// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartPoint _$SmartPointFromJson(Map<String, dynamic> json) => SmartPoint(
      json['x'] as int,
      (json['y'] as num).toDouble(),
      json['time'] as String,
    );

Map<String, dynamic> _$SmartPointToJson(SmartPoint instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'time': instance.time,
    };
