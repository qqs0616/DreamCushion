import 'package:json_annotation/json_annotation.dart';

import 'api_exception.dart';

part 'result_entity.g.dart';

@JsonSerializable()
class ResultEntity {
  int? code;
  String? msg;
  dynamic data;

  ResultEntity({this.code, this.msg, this.data});

  bool isSuccess() {
    return code == 0 || code == 200;
  }

  factory ResultEntity.fromJson(Map<String, dynamic> json) =>
      _$ResultEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ResultEntityToJson(this);
}

class IntensifyEntity<T> {
  late ResultEntity _baseEntity;
  T? _data;

  IntensifyEntity(
      {ResultEntity? baseEntity,
      bool succeedEntity = false,
      T? data,
      T Function(ResultEntity)? createData}) {
    if (baseEntity == null && succeedEntity) {
      baseEntity = ResultEntity(code: 200);
    }
    this._baseEntity = baseEntity!;
    if (!this._baseEntity.isSuccess()) {
      throw ApiException.of(this._baseEntity);
    }
    this._data = data;
    if (this._data == null && createData != null) {
      this._data = createData.call(this._baseEntity);
    }
  }

  get data => this._data;

  bool isSuccess() {
    return _baseEntity.isSuccess();
  }

  get baseEntity => _baseEntity;

  int? getCode() {
    return _baseEntity.code;
  }

  String getMsg() {
    return _baseEntity.msg ?? "";
  }

  Map<String, dynamic> getSrcData() {
    return _baseEntity.data;
  }
}
