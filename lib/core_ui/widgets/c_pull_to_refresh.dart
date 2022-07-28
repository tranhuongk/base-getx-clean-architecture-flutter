import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common/base_controller.dart';
import 'c_loading_view.dart';

class CPullToRefresh<T> extends StatelessWidget {
  const CPullToRefresh({
    Key? key,
    this.child,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.enableTwoLevel = false,
    this.scrollController,
    this.tag,
    this.loadingColor,
    this.controller,
    this.onRefresh,
    this.onLoading,
    this.onTwoLevel,
  }) : super(key: key);

  final Widget? child;
  final bool enablePullDown;
  final bool enablePullUp;
  final bool enableTwoLevel;
  final ScrollController? scrollController;
  final String? tag;
  final Color? loadingColor;
  final RefreshController? controller;
  final Function()? onRefresh;
  final Function()? onLoading;
  final Function(bool)? onTwoLevel;

  @override
  Widget build(BuildContext context) {
    BaseController? _controller;

    if (!Get.isRegistered<T>(tag: tag) && controller == null) {
      return const SizedBox();
    }

    if (controller == null && (Get.find<T>(tag: tag) is BaseController)) {
      _controller = Get.find<T>(tag: tag) as BaseController;
      _controller.refreshController ??= RefreshController();
    }

    return SmartRefresher(
      controller:
          controller ?? _controller?.refreshController ?? RefreshController(),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      enableTwoLevel: enableTwoLevel,
      onRefresh: onRefresh ?? _controller?.onRefresh,
      onLoading: onLoading ?? _controller?.onLoading,
      onTwoLevel: onTwoLevel ?? _controller?.onTwoLevel,
      child: child,
      scrollController: scrollController,
      header: CustomHeader(
        builder: (context, mode) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CLoading(
              color: loadingColor,
            ),
          );
        },
      ),
      footer: CustomFooter(
        builder: (context, mode) {
          if (mode == LoadStatus.loading) {
            return const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CLoading(),
            );
          }
          return const SizedBox(height: 0);
        },
      ),
    );
  }
}
