import 'package:base_app_flutter/app/data/providers/local_data/auth_local.dart';
import 'package:base_app_flutter/common/common.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../app/data/models/login/user_model.dart';
import '../core_ui/widgets/c_dialog.dart';
import 'datetime_picker.dart';
import 'network/api_error.dart';

abstract class BaseController extends GetxController
    with DialogsMixin, DateTimePicker {
  final RxBool isLoading = true.obs;
  RefreshController? refreshController;

  Rx<UserModel> get _user => AuthLocal.user;
  UserModel get user => _user();
  set user(UserModel val) => AuthLocal.setUser(val);

  @override
  void onInit() {
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    super.onClose();
  }

  void onRefresh() async {}
  void onLoading() async {}
  void onTwoLevel(bool val) async {}

  @protected
  void showError(String message) => Common.instance.showError(message);

  @protected
  void showSuccess(String message) => Common.instance.showSuccess(message);

  void logout() {
    AuthLocal.clearAllUserData();
  }

  void processUsecaseResult<T>({
    required Either<APIErrors, T> result,
    Function(T)? onSuccess,
    bool Function(APIErrors)? shouldShowError,
    bool? isRefreshing,
    RefreshController? controller,
  }) {
    result.fold((error) {
      bool shoudShow = true;
      isLoading(false);
      if (shouldShowError != null) {
        shoudShow = shouldShowError(error);
      }
      if (shoudShow) {
        showError(error.details);
      }

      if ((controller ?? refreshController) != null && isRefreshing != null) {
        isRefreshing
            ? (controller ?? refreshController)!.refreshFailed()
            : (controller ?? refreshController)!.loadFailed();
      }
    }, (data) {
      isLoading(false);
      if (onSuccess != null) {
        onSuccess(data);
      }
      if ((controller ?? refreshController) != null && isRefreshing != null) {
        if (isRefreshing) {
          (controller ?? refreshController)!
              .refreshCompleted(resetFooterState: true);
        } else {
          if (data is List && data.isEmpty) {
            (controller ?? refreshController)!.loadNoData();
          } else {
            (controller ?? refreshController)!.loadComplete();
          }
        }
      }
    });
  }
}
