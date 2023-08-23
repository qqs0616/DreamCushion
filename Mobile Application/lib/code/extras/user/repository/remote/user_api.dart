import 'package:flutter/cupertino.dart';
import 'package:flutter_slc_boxes/flutter/slc/network/api_constant.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:smart_sleep/code/extras/user/entity/login_result.dart';
import 'package:smart_sleep/code/extras/user/entity/user.dart';

import '../../../../base/api/api_config.dart';
import '../../../../base/api/base_dio.dart';
import '../../../../base/api/result_entity.dart';
import '../../../../base/vm/global_vm.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: ApiConfig.API_URL)
abstract class UserApiClient {
  factory UserApiClient({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _UserApiClient(dio, baseUrl: baseUrl);
  }

  ///用户登录
  @POST("/client/blade-auth/oauth/token")
  @Headers({"content-type": ApiConstant.VALUE_APPLICATION_URLENCODED})
  Future<ResultEntity> login(@Header('Tenant-Id') String tenantId,
      @Header("Authorization") String token, @Body() Map<String, Object> data);

  ///用户信息
  @GET("/blade-user/info")
  Future<ResultEntity> info(@Queries() Map<String, Object> queries);
}

///用户服务
class UserServiceRepository {
  static final UserApiClient _userApiClient = UserApiClient();

  ///获取用户信息
  /*static Future<IntensifyEntity<User>> info(String userId) async {
    Map<String, Object> queryUserInfo = {};
    queryUserInfo["userId"] = userId;
    ResultEntity? baseEntity = await _userApiClient.info(queryUserInfo);
    IntensifyEntity<User> intensifyEntity = IntensifyEntity<User>(
        baseEntity: baseEntity,
        createData: (baseEntity) => User.fromJson(baseEntity.data));
    //将用户信息存入全局数据
    if (intensifyEntity.isSuccess()) {
      GlobalVm().userVmBox.userInfoOf.value = intensifyEntity.data;
    }
    return intensifyEntity;
  }*/

  ////用户登录
  /*static Future<IntensifyEntity<User>> login(String account, String password, CancelToken cancelToken) async {
    try {
      Map<String, Object> dataMap = {};
      dataMap["tenantId"] = "000000";
      dataMap["username"] = account;
      dataMap["password"] = password;
      dataMap["password"] = md5.convert(utf8.encode(password)).toString();
      dataMap["grant_type"] = "password";
      dataMap["scope"] = "all";
      ResultEntity? baseEntity = await _userApiClient.login(
          "000000", "Basic c2FiZXI6c2FiZXJfc2VjcmV0", dataMap);
      IntensifyEntity<LoginResult> intensifyEntity =
          IntensifyEntity<LoginResult>(
              baseEntity: baseEntity,
              createData: (baseEntity) =>
                  LoginResult.fromJson(baseEntity.data));
      //获取用户信息
      if (intensifyEntity.isSuccess()) {
        ApiConfig().token = "bearer ${intensifyEntity.data.access_token}";
        return await info(intensifyEntity.data.user_id);
      }
      return IntensifyEntity(baseEntity: intensifyEntity.baseEntity);
    } on Exception catch (e) {
      return IntensifyEntity(baseEntity: BaseDio.getInstance().getDioError(e));
    }
  }*/

  ///获取用户信息
  static Future<IntensifyEntity<User>> info(String userId) async {
    Map<String, Object> queryUserInfo = {};
    queryUserInfo["userId"] = userId;
    return _userApiClient
        .info(queryUserInfo)
        .asStream()
        .map<IntensifyEntity<User>>((baseEntity) {
      IntensifyEntity<User> intensifyEntity = IntensifyEntity<User>(
          baseEntity: baseEntity,
          createData: (baseEntity) => User.fromJson(baseEntity.data));
      //将用户信息存入全局数据
      GlobalVm().userVmBox.userInfoOf.value = intensifyEntity.data;
      return intensifyEntity;
    }).single;
  }

  ///用户登录
  static Future<IntensifyEntity<User>> login(
      String account, String password, CancelToken cancelToken) async {
    Map<String, Object> dataMap = {};
    dataMap["tenantId"] = "000000";
    dataMap["username"] = account;
    dataMap["password"] = password;
    dataMap["password"] = md5.convert(utf8.encode(password)).toString();
    dataMap["grant_type"] = "password";
    dataMap["scope"] = "all";
    return _userApiClient
        .login("000000", "Basic c2FiZXI6c2FiZXJfc2VjcmV0", dataMap)
        .asStream()
        .map((event) {
      var intensifyEntity = IntensifyEntity<LoginResult>(
          baseEntity: event,
          createData: (baseEntity) => LoginResult.fromJson(baseEntity.data));
      ApiConfig().token = "bearer ${intensifyEntity.data.access_token}";
      return intensifyEntity;
    }).asyncMap<IntensifyEntity<User>>((event)async {
      return info(event.data.user_id);
    }).single;
  }

  static bool isRunningInUIThread() {
    return WidgetsBinding.instance.isRootWidgetAttached ?? false;
  }

}
