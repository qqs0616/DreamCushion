import 'package:json_annotation/json_annotation.dart';
import 'package:smart_sleep/code/base/entity/base_entify.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseEntity {
  //用户编号
  String? code;

  //用户平台
  int? userType;

  //账号
  String? account;

  //密码
  String? password;

  //昵称
  String? name;

  //真名
  String? realName;

  //头像
  String? avatar;

  //邮箱
  String? email;

  //手机
  String? phone;

  //生日
  String? birthday;

  //性别
  int? sex;

  //角色id
  String? roleId;

  //部门id
  String? deptId;

  //岗位id
  String? postId;

  //用户平台名
  String? userTypeName;

  //角色名
  String? roleName;

  //部门名
  String? deptName;

  //岗位名
  String? postName;

  //性别
  String? sexName;

  //拓展信息
  String? userExt;

  User(
      {this.code,
      this.userType,
      this.account,
      this.password,
      this.name,
      this.realName,
      this.avatar,
      this.email,
      this.phone,
      this.birthday,
      this.sex,
      this.roleId,
      this.deptId,
      this.postId,
      this.userTypeName,
      this.roleName,
      this.deptName,
      this.postName,
      this.sexName,
      this.userExt,
      super.id,
      super.createUser,
      super.createDept,
      super.createTime,
      super.updateUser,
      super.updateTime,
      super.status,
      super.isDeleted});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
