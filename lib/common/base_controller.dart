import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/state_manager.dart';

import '../app/domain/entities/user_entity.dart';
import '../core_ui/widgets/c_widget.dart';
import 'datetime_picker.dart';
import 'local/hive_services.dart';
import 'network/api_error.dart';

class BaseController extends GetxController with DialogsMixin, DateTimePicker {
  final RxBool isLoading = true.obs;
  final Rx<APIErrors> apiError =
      Rx<APIErrors>(FetchDataError("", showLog: false));

  Rx<UserEntity> get _user => HiveServices.user;
  UserEntity get user => _user();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;

    EasyLoading.instance.userInteractions = true;

    isLoading.stream.listen((event) {
      if (event) {
        EasyLoading.dismiss();
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }
    });

    apiError.stream.listen((error) {
      if (error.details != null && error.details.isNotEmpty) {
        EasyLoading.dismiss();
        EasyLoading.showError(error.details);
      }
    });
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
