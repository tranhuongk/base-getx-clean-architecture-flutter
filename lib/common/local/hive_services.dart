import 'package:base_app_flutter/app/data/providers/local_data/auth_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  HiveServices._();
  static const String _boxName = "hive_box";
  static const String _localeKey = "store_locale_key";
  static late final Box hiveBox;

  static Future init() async {
    await Hive.initFlutter();
    hiveBox = await Hive.openBox(_boxName);
    await AuthLocal.init();
  }

  /// Store locale
  static Locale get languageCode => Locale(
        hiveBox.get(
          _localeKey,
          defaultValue: "vi",
        ),
      );
  static Future<void> setLanguageCode(Locale locale) {
    Get.updateLocale(locale);
    return hiveBox.put(_localeKey, locale.languageCode);
  }
}
