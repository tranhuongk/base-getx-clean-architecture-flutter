import 'package:get/get.dart';

class Common {
  Common._();

  static void dismissKeyboard() => Get.focusScope!.unfocus();
}
