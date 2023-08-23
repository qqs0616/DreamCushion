import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:retrofit/http.dart';

import '../../../../base/api/api_config.dart';
import '../../../../base/api/base_dio.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../base/api/result_entity.dart';
import '../../../../base/config/constant_base.dart';
import '../../entity/smart_dev_data_entity.dart';
import '../../entity/smart_dev_event.dart';

part 'smart_mqtt_api.g.dart';

///mqtt消息服务
@RestApi(baseUrl: ApiConfig.API_URL)
abstract class SmartMqttApi {
  factory SmartMqttApi({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _SmartMqttApi(dio, baseUrl: baseUrl);
  }

  ///发送消息
  @POST("/blade-smart/mqtt/sendMsg")
  Future<ResultEntity> sendMsg(@Body() Map<String, dynamic> data);
}

///mqtt消息服务
class SmartMqttApiRepository {
  static final SmartMqttApi _smartMqttApi = SmartMqttApi();

  ///根据日期查询记录列表
  static Future<IntensifyEntity> sendMsg(SmartDevEvent smartMqttMsg) async {
    return _smartMqttApi
        .sendMsg(smartMqttMsg.toJson())
        .asStream()
        .map<IntensifyEntity<List<SmartDevDataEntity>>>((baseEntity) {
      IntensifyEntity<List<SmartDevDataEntity>> intensifyEntity =
          IntensifyEntity<List<SmartDevDataEntity>>(baseEntity: baseEntity);
      return intensifyEntity;
    }).single;
  }
}
