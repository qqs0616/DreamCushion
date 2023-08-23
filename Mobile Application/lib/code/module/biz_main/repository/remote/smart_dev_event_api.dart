import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:retrofit/http.dart';

import '../../../../base/api/api_config.dart';
import '../../../../base/api/base_dio.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../base/api/result_entity.dart';
import '../../../../base/config/constant_base.dart';
import '../../entity/smart_dev_data_entity.dart';
import '../../entity/smart_dev_event.dart';

part 'smart_dev_event_api.g.dart';

///消息事件缓存
@RestApi(baseUrl: ApiConfig.API_URL)
abstract class SmartDevEventApi {
  factory SmartDevEventApi({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _SmartDevEventApi(dio, baseUrl: baseUrl);
  }

  ///根据当前账户获取详情
  @GET("/blade-smart/dev_event/detailByCurrentUser")
  Future<ResultEntity> detailByCurrentUser();
}

///消息事件缓存
class SmartDevEventApiRepository {
  static final SmartDevEventApi _smartMqttApi = SmartDevEventApi();

  ///根据当前账户获取详情
  static Future<IntensifyEntity<SmartDevEvent>> queryByTopic(
      String topic) async {
    return _smartMqttApi
        .detailByCurrentUser()
        //.queryByTopic(Uri.encodeFull(topic))
        .asStream()
        .map<IntensifyEntity<SmartDevEvent>>((baseEntity) {
      IntensifyEntity<SmartDevEvent> intensifyEntity =
      IntensifyEntity<SmartDevEvent>(
          baseEntity: baseEntity, createData: (baseEntity) {
        return SmartDevEvent.fromJson(baseEntity.data);
      });
      return intensifyEntity;
    }).single;
  }
}
