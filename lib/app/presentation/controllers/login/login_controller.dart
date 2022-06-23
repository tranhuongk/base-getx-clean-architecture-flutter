import 'package:flutter/material.dart';

import '../../../../common/base_controller.dart';
import '../../../data/providers/local_data/auth_local.dart';
import '../../../domain/usecases/login_usecase.dart';

class LoginController extends BaseController {
  final LoginUsecase loginUsecase;

  LoginController(this.loginUsecase);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // todo
  }

  void login() async {
    // test show datetime picker
    // cShowDateTimePicker(
    //   mode: DateTimePickerMode.time,
    //   onChoosed: (datetime) {
    //     log(datetime.toString());
    //   },
    // );
    isLoading(true);
    final _result = await loginUsecase(
      username: usernameController.value.text,
      password: passwordController.value.text,
    );
    processUsecaseResult<Map<String, String>>(
      result: _result,
      onSuccess: (map) {
        isLoading(false);
        AuthLocal.setToken(map["jwt"]);
      },
      shouldShowError: (error) => true,
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
