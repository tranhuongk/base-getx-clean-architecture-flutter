import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/presentation/controllers/login/login_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => Container(),
      binding: LoginBinding(),
    ),
  ];
}
