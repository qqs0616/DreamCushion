// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_dev_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartDevDataEntity _$SmartDevDataEntityFromJson(Map<String, dynamic> json) =>
    SmartDevDataEntity(
      id: json['id'] as String?,
      devId: json['devId'] as String?,
      topic: json['topic'] as String?,
      qos: json['qos'] as int?,
      angleX: (json['angleX'] as num?)?.toDouble(),
      angleY: (json['angleY'] as num?)?.toDouble(),
      angleZ: (json['angleZ'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      p0: (json['p0'] as num?)?.toDouble(),
      p1: (json['p1'] as num?)?.toDouble(),
      p2: (json['p2'] as num?)?.toDouble(),
      p3: (json['p3'] as num?)?.toDouble(),
      sound: (json['sound'] as num?)?.toDouble(),
      createTime: json['createTime'] as String?,
    );

Map<String, dynamic> _$SmartDevDataEntityToJson(SmartDevDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'devId': instance.devId,
      'topic': instance.topic,
      'qos': instance.qos,
      'angleX': instance.angleX,
      'angleY': instance.angleY,
      'angleZ': instance.angleZ,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'p0': instance.p0,
      'p1': instance.p1,
      'p2': instance.p2,
      'p3': instance.p3,
      'sound': instance.sound,
      'createTime': instance.createTime,
    };
