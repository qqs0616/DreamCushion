// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      json['tenant_id'] as String,
      json['user_id'] as String,
      json['access_token'] as String,
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'tenant_id': instance.tenant_id,
      'user_id': instance.user_id,
      'access_token': instance.access_token,
    };
