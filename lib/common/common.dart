import 'dart:async';

import 'package:base_app_flutter/core_ui/themes/c_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core_ui/themes/c_colors.dart';
import '../core_ui/widgets/c_widget.dart';

class Common with DialogsMixin {
  Common._();
  static final Common instance = Common._();
  Completer? waitingShow;

  static void dismissKeyboard() => Get.focusScope!.unfocus();

  void showError(String message) => _showSuccessError(message);
  void showSuccess(String message) =>
      _showSuccessError(message, isSuccess: true);

  void _showSuccessError(String message, {bool isSuccess = false}) {
    waitingShow = Completer();
    final _timer = Timer(const Duration(seconds: 2), () {
      if (!(waitingShow?.isCompleted ?? true)) {
        Get.back();
        waitingShow?.complete();
      }
    });
    cShowDialog(
      child: Material(
        color: CColors.transparentColor,
        child: Column(
          children: [
            Icon(
              isSuccess ? CupertinoIcons.check_mark : CupertinoIcons.clear,
              color: CColors.whiteColor,
            ),
            const VSpace(8),
            Flexible(
              child: CText(
                message,
                textAlign: TextAlign.center,
                style: CTextStyles.base.whiteColor,
              ),
            ),
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      backgroundColor: CColors.blackColor.withOpacity(0.8),
      barrierColor: CColors.transparentColor,
    ).then((value) {
      if (_timer.isActive) {
        _timer.cancel();
      }
      if (!(waitingShow?.isCompleted ?? true)) {
        waitingShow?.complete();
      }
    });
  }
}
