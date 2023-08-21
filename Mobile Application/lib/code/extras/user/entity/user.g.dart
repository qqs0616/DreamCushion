// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      code: json['code'] as String?,
      userType: json['userType'] as int?,
      account: json['account'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      realName: json['realName'] as String?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      birthday: json['birthday'] as String?,
      sex: json['sex'] as int?,
      roleId: json['roleId'] as String?,
      deptId: json['deptId'] as String?,
      postId: json['postId'] as String?,
      userTypeName: json['userTypeName'] as String?,
      roleName: json['roleName'] as String?,
      deptName: json['deptName'] as String?,
      postName: json['postName'] as String?,
      sexName: json['sexName'] as String?,
      userExt: json['userExt'] as String?,
      id: json['id'] as String?,
      createUser: json['createUser'] as String?,
      createDept: json['createDept'] as String?,
      createTime: json['createTime'] as String?,
      updateUser: json['updateUser'] as String?,
      updateTime: json['updateTime'] as String?,
      status: json['status'] as int?,
      isDeleted: json['isDeleted'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createUser': instance.createUser,
      'createDept': instance.createDept,
      'createTime': instance.createTime,
      'updateUser': instance.updateUser,
      'updateTime': instance.updateTime,
      'status': instance.status,
      'isDeleted': instance.isDeleted,
      'code': instance.code,
      'userType': instance.userType,
      'account': instance.account,
      'password': instance.password,
      'name': instance.name,
      'realName': instance.realName,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'sex': instance.sex,
      'roleId': instance.roleId,
      'deptId': instance.deptId,
      'postId': instance.postId,
      'userTypeName': instance.userTypeName,
      'roleName': instance.roleName,
      'deptName': instance.deptName,
      'postName': instance.postName,
      'sexName': instance.sexName,
      'userExt': instance.userExt,
    };
