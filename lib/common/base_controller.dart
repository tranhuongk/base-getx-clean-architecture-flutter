import 'package:base_app_flutter/app/data/models/login/user_model.dart';
import 'package:base_app_flutter/app/data/providers/local_data/auth_local.dart';
import 'package:dartz/dartz.dart';
import 'package:get/state_manager.dart';

import '../core_ui/widgets/c_widget.dart';
import 'datetime_picker.dart';
import 'network/api_error.dart';

class BaseController extends GetxController with DialogsMixin, DateTimePicker {
  final RxBool isLoading = true.obs;
  final Rx<APIErrors> apiError =
      Rx<APIErrors>(FetchDataError("", showLog: false));

  Rx<UserModel> get _user => AuthLocal.user;
  UserModel get user => _user();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
  }

  void processUsecaseResult<T>({
    required Either<APIErrors, T> result,
    Function(T)? onSuccess,
    bool Function(APIErrors)? shouldShowError,
    // RefreshController? refreshController,
    bool isRefreshing = true,
  }) {
    result.fold((error) {
      bool shoudShow = true;
      if (shouldShowError != null) {
        shoudShow = shouldShowError(error);
      }
      if (shoudShow) {
        apiError(error);
      }

      // if (refreshController != null) {
      //   isRefreshing
      //       ? refreshController.refreshFailed()
      //       : refreshController.loadFailed();
      // }
    }, (data) {
      if (onSuccess != null) {
        onSuccess(data);
      }
      // if (refreshController != null) {
      //   if (isRefreshing) {
      //     refreshController.refreshCompleted(resetFooterState: true);
      //   } else {
      //     if (data is List && data.isEmpty) {
      //       refreshController.loadNoData();
      //     } else {
      //       refreshController.loadComplete();
      //     }
      //   }
      // }
    });
  }
}
