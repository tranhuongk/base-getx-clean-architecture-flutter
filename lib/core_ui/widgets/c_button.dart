import 'package:flutter/cupertino.dart';
import '../core_ui.dart';
import '../themes/c_colors.dart';
import '../themes/c_text_styles.dart';
import 'c_jumping_dots.dart';

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
  final bool isLoading;
  final Color loadingColor;

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
    this.isLoading = false,
    this.loadingColor = CColors.whiteColor,
  }) : super(key: key);

  factory CButton.base(
    String text, {
    double? width = double.infinity,
    double? height = 56,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? color,
    Widget? prefixWidget,
    Widget? suffixWidget,
    double space = 8,
    TextStyle? textStyle,
    bool isLoading = false,
    Color loadingColor = CColors.whiteColor,
  }) =>
      CButton(
        text: text,
        width: width,
        height: height,
        onTap: onTap,
        isLoading: isLoading,
        borderRadius: borderRadius ?? BorderRadius.circular(6),
        color: color ?? CColors.mainColor,
        textStyle: textStyle ?? CTextStyles.base.w600(20),
        margin: margin,
        padding: padding,
        backgroundColor: backgroundColor,
        prefixWidget: prefixWidget,
        suffixWidget: suffixWidget,
        space: space,
        loadingColor: loadingColor,
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
    bool isLoading = false,
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
        isLoading: isLoading,
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
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? color,
    Color? backgroundColor,
  }) =>
      CButton(
        text: "",
        width: width,
        height: height,
        onTap: onTap,
        margin: margin,
        padding: padding,
        borderRadius: BorderRadius.circular(radius),
        color: color ?? CColors.transparentColor,
        backgroundColor: backgroundColor ?? CColors.transparentColor,
        space: 0,
        prefixWidget: child,
        isOnlyIcon: true,
      );

  factory CButton.icon(
    Widget icon, {
    double? width,
    double? height,
    VoidCallback? onTap,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    Color? backgroundColor,
    Color? color,
    BoxShadow? boxShadow,
    Border? border,
    EdgeInsets? padding,
  }) =>
      CButton(
        text: "",
        width: width,
        height: height,
        onTap: onTap,
        padding: padding,
        borderRadius: borderRadius ?? BorderRadius.circular(6),
        color: color ?? CColors.mainColor,
        textStyle: CTextStyles.base.w600(20),
        margin: margin,
        backgroundColor: backgroundColor,
        boxShadow: boxShadow,
        border: border,
        space: 0,
        prefixWidget: icon,
        isOnlyIcon: true,
      );

  @override
  Widget build(BuildContext context) {
    var child = isLoading
        ? JumpingDots(
            color: loadingColor,
            animationDuration: const Duration(milliseconds: 300),
            radius: 6,
            innerPadding: 3,
          )
        : isOnlyIcon
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
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Opacity(
          opacity: onTap == null ? 0.7 : 1,
          child: ColoredBox(
            color: backgroundColor ?? CColors.transparentColor,
            child: CupertinoButton(
              onPressed: isLoading ? null : onTap,
              color: color,
              minSize: 0,
              padding: EdgeInsets.zero,
              borderRadius: borderRadius,
              disabledColor: color,
              child:
                  // isCanvas
                  //     ? Container(
                  //         width: width,
                  //         height: height,
                  //         margin: margin,
                  //         child: CustomPaint(
                  //           size: Size(
                  //             // 100,
                  //             // 20,
                  //             width ?? 180,
                  //             ((width ?? 180) * 0.31216931216931215).toDouble(),
                  //           ),
                  //           painter: RPSCustomPainter(),
                  //           child: _child,
                  //         ),
                  //       )
                  //     :
                  Container(
                width: width,
                height: height,
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: border,
                  boxShadow: boxShadow != null ? [boxShadow!] : null,
                  gradient: gradient,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
