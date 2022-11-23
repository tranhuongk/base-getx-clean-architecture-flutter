import 'package:get/get.dart';

import '../app/data/repositories/auth_repository_impl.dart';
import '../app/domain/usecases/login_usecase.dart';

class InjectionContainer {
  InjectionContainer._();

  static void initialRepository() {
    login();
  }

  static void login() {
    Get.lazyPut(
      () => AuthRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginUsecase(Get.find<AuthRepositoryImpl>()),
      fenix: true,
    );
  }
}
