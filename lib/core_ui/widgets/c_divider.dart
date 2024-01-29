import 'package:base_app_flutter/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HDivider extends CContainer {
  const HDivider({double height = 0.5, Color? color, Key? key})
      : super(
          key: key,
          height: height,
          width: double.infinity,
          color: color ?? CColors.grey70Color,
        );
}

class VDivider extends CContainer {
  const VDivider({double width = 0.5, Color? color, Key? key})
      : super(
          key: key,
          width: width,
          height: double.infinity,
          color: color ?? CColors.grey70Color,
        );
}
