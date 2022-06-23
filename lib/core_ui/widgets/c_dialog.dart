// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogTransition { fromLeft, fromBottom, fromTop, fromRight }

mixin DialogsMixin {
  CShowDialog({
    double? width,
    double? height,
    Widget? child,
    VoidCallback? onPressed,
    Alignment alignment = Alignment.center,
    DialogTransition? transition,
    Color? backgroundColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
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
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
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
          child: Align(
            alignment: alignment,
            child: IntrinsicHeight(
              child: Container(
                width: width,
                height: height,
                child: ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(12),
                  child: child,
                ),
                margin: margin,
                padding: padding,
                decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.white,
                  borderRadius: borderRadius ?? BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
