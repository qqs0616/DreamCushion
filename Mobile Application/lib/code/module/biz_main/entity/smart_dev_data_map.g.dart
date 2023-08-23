// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_dev_data_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartDevDataMap _$SmartDevDataMapFromJson(Map<String, dynamic> json) =>
    SmartDevDataMap(
      (json['angleXList'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['angleYList'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['angleZList'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['p0List'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['p1List'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['p2List'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['p3List'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['temperatureList'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['humidityList'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['soundList'] as List<dynamic>?)
          ?.map((e) => SmartPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SmartDevDataMapToJson(SmartDevDataMap instance) =>
    <String, dynamic>{
      'angleXList': instance.angleXList,
      'angleYList': instance.angleYList,
      'angleZList': instance.angleZList,
      'p0List': instance.p0List,
      'p1List': instance.p1List,
      'p2List': instance.p2List,
      'p3List': instance.p3List,
      'temperatureList': instance.temperatureList,
      'humidityList': instance.humidityList,
      'soundList': instance.soundList,
    };
