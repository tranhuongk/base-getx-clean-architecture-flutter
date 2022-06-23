import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app/domain/entities/user_entity.dart';

class HiveServices {
  HiveServices._();
  static const String _boxName = "sen_hive_box";
  static const String _userKey = "store_user_key";

  static late final Box hiveBox;

  static final Rx<UserEntity> user = UserEntity().obs;

  static Future init() async {
    await Hive.initFlutter();

    hiveBox = await Hive.openBox(_boxName);
    hiveBox.listenable(keys: [_userKey]).addListener(() {});
  }
}
