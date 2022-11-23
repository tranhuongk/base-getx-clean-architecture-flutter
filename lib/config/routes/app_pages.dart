import 'package:base_app_flutter/app/presentation/pages/login/login_page.dart';
import 'package:get/get.dart';

import '../../app/presentation/controllers/login/login_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
