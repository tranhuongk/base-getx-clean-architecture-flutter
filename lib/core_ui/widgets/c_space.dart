import 'package:flutter/material.dart';

class HSpace extends SizedBox {
  const HSpace(double height, {Key? key})
      : super(
          key: key,
          height: height,
        );
}

class VSpace extends SizedBox {
  const VSpace(double width, {Key? key})
      : super(
          key: key,
          width: width,
        );
}
