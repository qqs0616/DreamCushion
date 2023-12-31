import 'package:flutter_slc_boxes/flutter/slc/network/api_constant.dart';

class ApiConfig extends ApiConstant {
  static const String KEY_TOKEN = "Blade-Auth";
  static const int CODE_UNKNOWN_MISTAKE = 500;
  static const String STR_UNKNOWN_MISTAKE = "Unknown mistake";

  //自己的
  //static const String API_URL = "http://192.168.166.66:9200";
  static const String API_URL = "http://121.40.31.87:9200";

  ApiConfig._privateConstructor();

  static final ApiConfig _instance = ApiConfig._privateConstructor();

  factory ApiConfig() {
    return _instance;
  }

  String? token;
}

abstract class OnSuccess<T> {}

abstract class OnError<int, String> {
  OnError._() {
    throw new UnsupportedError("OnSuccess can't be instantiated");
  }
}
