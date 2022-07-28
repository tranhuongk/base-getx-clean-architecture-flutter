// ignore_for_file: non_constant_identifier_names
import 'package:base_app_flutter/app/data/providers/local_data/auth_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/c_colors.dart';
import 'c_widget.dart';

enum DialogTransition { fromLeft, fromBottom, fromTop, fromRight }

mixin DialogsMixin {
  Future cShowDialog({
    double? width,
    double? height,
    Widget? child,
    VoidCallback? onPressed,
    Alignment alignment = Alignment.center,
    DialogTransition? transition,
    Color? backgroundColor,
    Color? barrierColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    bool barrierDismissible = true,
    BoxShadow? boxShadow,
  }) async {
    Offset? _initOffset;
    switch (transition) {
      case DialogTransition.fromLeft:
        _initOffset = const Offset(-1, 0);
        break;
      case DialogTransition.fromBottom:
        _initOffset = const Offset(0, 1);
        break;
      case DialogTransition.fromTop:
        _initOffset = const Offset(0, -1);
        break;
      case DialogTransition.fromRight:
        _initOffset = const Offset(1, 0);
        break;
      default:
        break;
    }

    await Get.generalDialog(
      barrierLabel: "Barrier",
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? CColors.blackColor.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: transition == null
          ? null
          : (context, anim1, anim2, child) {
              return SlideTransition(
                position: Tween(
                  begin: _initOffset,
                  end: const Offset(0, 0),
                ).animate(anim1),
                child: child,
              );
            },
      pageBuilder: (_, __, ___) {
        return SafeArea(
          minimum: EdgeInsets.only(bottom: MediaQuery.of(_).viewInsets.bottom),
          child: Align(
            alignment: alignment,
            child: IntrinsicHeight(
              child: CContainer(
                width: width,
                height: height,
                child: ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(12),
                  child: Container(
                    padding: padding,
                    child: child,
                  ),
                ),
                margin: margin,
                borderRadius: borderRadius ?? BorderRadius.circular(12),
                color: backgroundColor ?? CColors.whiteColor,
                boxShadow: boxShadow,
              ),
            ),
          ),
        );
      },
    );
  }
}

pleaseLogin() {
  Get.generalDialog(
    barrierDismissible: false,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return SafeArea(
        child: Center(
          child: CContainer(
            color: CColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // CContainer(
                //   padding: const EdgeInsets.all(16.0),
                //   child: CText(
                //     LocaleKeys.authentication_expire_token,
                //     style: CTextStyles.base.grey85Color.w400(14),
                //     textAlign: TextAlign.center,
                //   ),
                //   border: const Border(
                //     bottom: BorderSide(
                //       width: 0.5,
                //       color: CColors.grey55Color,
                //     ),
                //   ),
                // ),
                // CButton.inkwell(
                //   onTap: Get.back,
                //   child: const CText(
                //     LocaleKeys.buttons_login,
                //   ),
                //   margin: const EdgeInsets.symmetric(vertical: 12),
                // )
              ],
            ),
          ),
        ),
      );
    },
  ).whenComplete(() => AuthLocal.clearAllUserData());
}
