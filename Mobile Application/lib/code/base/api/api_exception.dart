import 'package:smart_sleep/code/base/api/result_entity.dart';

class ApiException implements Exception {
  int code;
  String? message;

  ApiException(this.code, {this.message});

  factory ApiException.of(ResultEntity resultEntity) {
    return ApiException(resultEntity.code ?? 500,
        message: resultEntity.msg);
  }
}
