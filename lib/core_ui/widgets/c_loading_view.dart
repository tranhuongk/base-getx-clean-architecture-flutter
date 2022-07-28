import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base_controller.dart';
import '../themes/c_colors.dart';

class LoadingView<T> extends GetView<T> {
  const LoadingView({
    Key? key,
    this.child,
    this.showBackground = true,
    this.color,
  }) : super(key: key);
  final Widget? child;
  final bool showBackground;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final _loadingWidget = SizedBox.expand(
      child: Container(
        color: CColors.transparentColor,
        child: Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: showBackground
                  ? CColors.whiteColor
                  : CColors.transparentColor,
            ),
            child: Platform.isAndroid
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        color ?? CColors.mainColor,
                      ),
                    ),
                  )
                : CupertinoActivityIndicator(
                    animating: true,
                    radius: 12,
                    color: color ?? CColors.mainColor,
                  ),
          ),
        ),
      ),
    );
    return Stack(
      fit: StackFit.expand,
      children: [
        if (child != null) child!,
        if (Get.isRegistered<T>() && (controller is BaseController))
          Obx(
            () => (controller as BaseController).isLoading()
                ? _loadingWidget
                : const SizedBox(),
          )
        else
          _loadingWidget
      ],
    );
  }
}

class CLoading extends StatelessWidget {
  const CLoading({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 28,
        width: 28,
        child: Platform.isAndroid
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? CColors.mainColor,
                  ),
                ),
              )
            : CupertinoActivityIndicator(
                animating: true,
                radius: 12,
                color: color ?? CColors.mainColor,
              ),
      ),
    );
  }
}
