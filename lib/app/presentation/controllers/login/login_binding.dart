import 'package:get/get.dart';
import '../../../domain/usecases/login_usecase.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find<LoginUsecase>()),
    );
  }
}
