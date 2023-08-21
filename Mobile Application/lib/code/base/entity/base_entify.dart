class BaseEntity {
  String? id;

  String? createUser;

  String? createDept;

  String? createTime;

  String? updateUser;

  String? updateTime;

  int? status;

  int? isDeleted;

  BaseEntity(
      {this.id,
      this.createUser,
      this.createDept,
      this.createTime,
      this.updateUser,
      this.updateTime,
      this.status,
      this.isDeleted});
}
