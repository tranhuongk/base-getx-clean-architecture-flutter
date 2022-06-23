import 'package:get/get.dart';

import '../app/data/repositories/login_repository_impl.dart';
import '../app/domain/usecases/login_usecase.dart';

class InjectionContainer {
  InjectionContainer._();

  static void initialRepository() {
    login();
  }

  static void login() {
    Get.lazyPut(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginUsecase(Get.find<LoginRepositoryImpl>()),
      fenix: true,
    );
  }
}
