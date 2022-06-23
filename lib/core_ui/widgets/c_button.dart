// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import '../themes/c_colors.dart';
import '../themes/c_text_styles.dart';
import 'c_widget.dart';

class CButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color color;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double space;
  final TextStyle textStyle;
  final BoxShadow? boxShadow;
  final BoxBorder? border;
  final Gradient? gradient;
  final bool isCanvas;
  final MainAxisAlignment mainAxisAlignment;
  final bool isOnlyIcon;

  const CButton({
    Key? key,
    this.onTap,
    this.width = 180,
    this.height = 50,
    this.text = "sample",
    this.borderRadius = BorderRadius.zero,
    this.color = CColors.grey40Color,
    this.backgroundColor = CColors.grey100Color,
    this.prefixWidget,
    this.suffixWidget,
    this.margin,
    this.padding,
    this.space = 4.0,
    this.textStyle = CTextStyles.base,
    this.boxShadow,
    this.border,
    this.gradient,
    this.isCanvas = false,
    this.isOnlyIcon = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  factory CButton.base(
    String text, {
    double? width = 160,
    double? height = 50,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    Color? backgroundColor,
    Color? color,
    BoxShadow? boxShadow,
    Border? border,
  }) =>
      CButton(
        text: text,
        width: width,
        height: height,
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(height ?? 0),
        color: color ?? CColors.mainColor,
        textStyle: CTextStyles.base.w600(20),
        margin: margin,
        backgroundColor: backgroundColor,
        boxShadow: boxShadow,
        border: border ?? Border.all(color: CColors.buttonWColor),
      );

  factory CButton.canvas(
    String text, {
    double? width = 180,
    double? height = 50,
    VoidCallback? onTap,
    EdgeInsets? margin,
    Color? backgroundColor,
    Color? color,
    BoxShadow? boxShadow,
  }) =>
      CButton(
        text: text,
        width: width,
        height: height,
        onTap: onTap,
        borderRadius: BorderRadius.zero,
        color: color ?? CColors.transparentColor,
        textStyle: CTextStyles.base.w600(20),
        margin: margin,
        backgroundColor: backgroundColor ?? CColors.transparentColor,
        boxShadow: boxShadow,
        isCanvas: true,
      );

  factory CButton.gradient(
    String text, {
    double? width = 125,
    double? height = 24,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    Color? backgroundColor,
    BoxShadow? boxShadow,
    Border? border,
    Gradient? gradient,
  }) =>
      CButton(
        text: text,
        width: width,
        height: height,
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(height ?? 0),
        color: CColors.mainColor,
        textStyle: CTextStyles.base.w400(14),
        margin: margin,
        backgroundColor: backgroundColor,
        boxShadow: boxShadow,
        border: border,
        gradient: gradient ??
            const LinearGradient(
              colors: CColors.linerAuth,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
      );

  factory CButton.inkwell({
    Widget? child,
    VoidCallback? onTap,
    double radius = 0,
    double? width,
    double? height,
  }) =>
      CButton(
        text: "",
        width: width,
        height: height,
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        color: CColors.transparentColor,
        backgroundColor: CColors.transparentColor,
        textStyle: CTextStyles.base.w600(20),
        space: 0,
        prefixWidget: child,
        isOnlyIcon: true,
      );

  factory CButton.icon(
    Widget icon, {
    double? width = 50,
    double? height = 50,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    Color? backgroundColor,
    BoxShadow? boxShadow,
    Border? border,
  }) =>
      CButton(
        text: "",
        width: width,
        height: height,
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(height ?? 0),
        color: CColors.mainColor,
        textStyle: CTextStyles.base.w600(20),
        margin: margin,
        backgroundColor: backgroundColor,
        boxShadow: boxShadow,
        border: border,
        space: 0,
        prefixWidget: icon,
        isOnlyIcon: true,
      );

  factory CButton.defaultBtn(
    String text, {
    double? width = 160,
    double? height = 50,
    VoidCallback? onTap,
    BorderRadius borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(24),
    ),
    EdgeInsets? margin,
    Color? backgroundColor,
    BoxShadow? boxShadow,
  }) =>
      CButton(
        text: text,
        width: width,
        height: height,
        onTap: onTap,
        borderRadius: borderRadius,
        color: CColors.mainColor,
        textStyle: CTextStyles.base.w600(20),
        margin: margin,
        backgroundColor: backgroundColor,
        boxShadow: boxShadow,
      );

  factory CButton.availableBtn(
    String text, {
    double? width = 180,
    double? height = 50,
    VoidCallback? onTap,
    BorderRadius borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(24),
    ),
    EdgeInsets? margin,
    Color? backgroundColor,
    BoxShadow? boxShadow,
  }) =>
      CButton(
        text: text,
        width: width,
        height: height,
        onTap: onTap,
        borderRadius: borderRadius,
        color: CColors.mainLightColor,
        textStyle: CTextStyles.base.w600(20),
        margin: margin,
        backgroundColor: backgroundColor,
        boxShadow: boxShadow ??
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 4,
              color: CColors.blackColor.withOpacity(0.25),
            ),
      );

  @override
  Widget build(BuildContext context) {
    final _child = isOnlyIcon
        ? prefixWidget
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if (prefixWidget != null)
                Padding(
                  padding: EdgeInsets.only(right: space),
                  child: prefixWidget,
                ),
              Flexible(
                child: CText(
                  text,
                  style: textStyle,
                ),
              ),
              if (suffixWidget != null)
                Padding(
                  padding: EdgeInsets.only(left: space),
                  child: suffixWidget,
                ),
            ],
          );
    return ClipRRect(
      borderRadius: borderRadius,
      child: Opacity(
        opacity: onTap == null ? 0.7 : 1,
        child: ColoredBox(
          color: backgroundColor ?? CColors.transparentColor,
          child: CupertinoButton(
            onPressed: onTap,
            color: color,
            minSize: 0,
            padding: EdgeInsets.zero,
            borderRadius: borderRadius,
            disabledColor: color,
            child: isCanvas
                ? Container(
                    width: width,
                    height: height,
                    margin: margin,
                    child: CustomPaint(
                      size: Size(
                        // 100,
                        // 20,
                        width ?? 180,
                        ((width ?? 180) * 0.31216931216931215).toDouble(),
                      ),
                      painter: RPSCustomPainter(),
                      child: _child,
                    ),
                  )
                : Container(
                    width: width,
                    height: height,
                    margin: margin,
                    padding: padding,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      border: border,
                      boxShadow: boxShadow != null ? [boxShadow!] : null,
                      gradient: gradient,
                    ),
                    child: _child,
                  ),
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.008);
    path_0.lineTo(size.width * 0.002, size.height * 0.008);
    path_0.lineTo(size.width * 0.002, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.4);
    path_0.lineTo(size.width * 0.88, size.height * 0.008);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = CColors.mainColor;
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.88, size.height * 0.4);
    path_1.lineTo(size.width * 0.88, size.height * 0.008);
    path_1.lineTo(size.width, size.height * 0.4);
    path_1.lineTo(size.width * 0.88, size.height * 0.4);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.95, size.height * 0.2),
        Offset(size.width * 0.88, size.height * 0.4), [
      const Color(0xff736759),
      const Color(0xffFFB802),
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
