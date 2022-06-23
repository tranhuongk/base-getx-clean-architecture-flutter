import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../../common/local/hive_services.dart';

class AuthLocal {
  static const String _tokenKey = "store_token_key";
  static const String _localeKey = "store_locale_key";
  static Box get hiveBox => HiveServices.hiveBox;

  /// Store token
  static String? get token => hiveBox.get(_tokenKey);
  static Future<void> setToken(String? token) => hiveBox.put(_tokenKey, token);

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
