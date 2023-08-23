import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../base/api/api_config.dart';
import '../../../../base/api/base_dio.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: ApiConfig.API_URL)
abstract class UserApiClient {
  factory UserApiClient({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _UserApiClient(dio, baseUrl: baseUrl);
  }
}

///用户服务
class UserServiceRepository {
  static final UserApiClient _userApiClient = UserApiClient();

}
