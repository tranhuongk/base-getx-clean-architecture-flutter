import 'package:base_app_flutter/app/data/models/login/user_model.dart';
import 'package:base_app_flutter/config/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../common/local/hive_services.dart';

class AuthLocal {
  static const String _tokenKey = "store_token_key";
  static const String _userKey = "store_user_key";
  static Box get hiveBox => HiveServices.hiveBox;
  static final Rx<UserModel> user = (const UserModel()).obs;

  /// Check is logged in to the app
  static bool get isLoggedIn => (token != null && token!.isNotEmpty);

  static Future init() async {
    /// Set value for user variable
    hiveBox.listenable(keys: [_userKey]).addListener(() {
      user.value = usermodel;
    });

    /// Log out
    hiveBox.listenable(keys: [_tokenKey]).addListener(() {
      if (token == null && Get.currentRoute != AppRoutes.login) {
        Get.offAll(AppRoutes.login);
      }
    });
  }

  /// Store token
  static String? get token => hiveBox.get(_tokenKey);
  static Future<void> setToken(String? token) => hiveBox.put(_tokenKey, token);

  /// Store user
  static UserModel get usermodel =>
      UserModel.fromJson(hiveBox.get(_userKey, defaultValue: {}));
  static Future<void> setUser(UserModel? usermodel) =>
      hiveBox.put(_userKey, usermodel?.toJson());

  /// Clear all data
  static Future clearAllUserData() async {
    await hiveBox.put(_tokenKey, null);
    await hiveBox.put(_userKey, null);
  }
}
