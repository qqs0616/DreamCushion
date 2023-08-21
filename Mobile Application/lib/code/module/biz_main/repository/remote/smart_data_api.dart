import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:retrofit/http.dart';

import '../../../../base/api/api_config.dart';
import '../../../../base/api/base_dio.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../../../base/api/result_entity.dart';
import '../../../../base/config/constant_base.dart';
import '../../entity/smart_dev_data_entity.dart';
import '../../entity/smart_dev_data_map.dart';

part 'smart_data_api.g.dart';

///睡眠数据服务
@RestApi(baseUrl: ApiConfig.API_URL)
abstract class SmartDataApi {
  factory SmartDataApi({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _SmartDataApi(dio, baseUrl: baseUrl);
  }

  ///根据日期查询记录列表
  @GET("/blade-smart/dev_data/getListByDate")
  Future<ResultEntity> getListByDate(@Query("targetDate") String targetDate);
  ///根据日期查询记录列表
  @GET("/blade-smart/dev_data/getListByDate2")
  Future<ResultEntity> getListByDate2(@Query("targetDate") String targetDate);
}

///睡眠数据服务
class SmartDataApiRepository {
  static final SmartDataApi _smartDataApi = SmartDataApi();

  ///根据日期查询记录列表
  static Future<IntensifyEntity<List<SmartDevDataEntity>>> getListByDate(
      DateTime targetDate) async {
    return _smartDataApi
        .getListByDate(DateUtil.formatDate(targetDate,
            format: ConstantBase.VALUE_TIME_PATTERN_BY_Y_S_COMMON))
        .asStream()
        .map<IntensifyEntity<List<SmartDevDataEntity>>>((baseEntity) {
      IntensifyEntity<List<SmartDevDataEntity>> intensifyEntity =
          IntensifyEntity<List<SmartDevDataEntity>>(
              baseEntity: baseEntity,
              createData: (baseEntity) {
                return SmartDevDataEntity.fromJsonArray(baseEntity.data);
              });
      return intensifyEntity;
    }).single;
  }

  ///根据日期查询记录列表
  static Future<IntensifyEntity<SmartDevDataMap>> getListByDate2(
      DateTime targetDate) async {
    return _smartDataApi
        .getListByDate2(DateUtil.formatDate(targetDate,
            format: ConstantBase.VALUE_TIME_PATTERN_BY_Y_S_COMMON))
        .asStream()
        .map<IntensifyEntity<SmartDevDataMap>>((baseEntity) {
      IntensifyEntity<SmartDevDataMap> intensifyEntity =
          IntensifyEntity<SmartDevDataMap>(
              baseEntity: baseEntity,
              createData: (baseEntity) {
                return SmartDevDataMap.fromJson(baseEntity.data);
              });
      return intensifyEntity;
    }).single;
  }
}
