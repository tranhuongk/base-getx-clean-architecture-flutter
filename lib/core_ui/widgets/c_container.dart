import 'package:flutter/material.dart';

import '../themes/c_colors.dart';

class CContainer extends StatelessWidget {
  final Color? color;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;
  final BoxConstraints? constraints;
  final BoxShadow? boxShadow;
  final Color borderColor;
  final double borderWidth;
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;

  const CContainer({
    Key? key,
    this.color,
    this.constraints,
    this.gradient,
    this.borderRadius,
    this.boxShadow,
    this.borderColor = CColors.transparentColor,
    this.borderWidth = 0,
    this.height,
    this.width,
    this.child,
    this.onTap,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        constraints: constraints,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          gradient: gradient,
          boxShadow: boxShadow != null ? [boxShadow!] : null,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
            style: borderWidth > 0 ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        child: child,
      ),
    );
  }
}
