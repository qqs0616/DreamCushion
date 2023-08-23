import 'package:flutter_slc_boxes/flutter/slc/code/observable_field.dart';
import 'package:smart_sleep/code/extras/user/entity/user.dart';

class UserVmBox {
  final ObservableField<User> userInfoOf = ObservableField(); //用户信息监听

  UserVmBox() {}

  void saveLoginInfo() {}
}
