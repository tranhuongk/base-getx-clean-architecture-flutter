import 'package:base_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../generated/assets.gen.dart';
import '../themes/c_colors.dart';
import '../themes/c_text_styles.dart';
import 'c_widget.dart';

class CTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final String? hintText;
  final FocusNode? focusNode;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? borderColorActive;
  final BorderRadius borderRadius;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final BoxShadow? boxShadow;
  final EdgeInsets? padding;
  final TextInputAction? textInputAction;

  /// return value of obscureText
  final Widget Function(bool)? prefixWidget;
  final bool prefixChangeObscureText;

  /// return value of obscureText
  final Widget Function(bool)? suffixWidget;
  final bool suffixChangeObscureText;
  final bool autofocus;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  const CTextFormField({
    Key? key,
    this.controller,
    this.obscureText,
    this.hintText,
    this.focusNode,
    this.width,
    this.height,
    this.onTap,
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    this.textAlign,
    this.hintStyle,
    this.style,
    this.prefixWidget,
    this.suffixWidget,
    this.enabled,
    this.autofocus = false,
    this.prefixChangeObscureText = false,
    this.suffixChangeObscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.borderColor,
    this.borderColorActive = CColors.mainColor,
    this.boxShadow,
    this.padding,
    this.textInputAction,
  }) : super(key: key);

  factory CTextFormField.text(
    String hintText, {
    double? width,
    double? height,
    TextEditingController? controller,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    Color? backgroundColor,
    BoxShadow? boxShadow,
    TextStyle? hintStyle,
    TextStyle? style,
    Widget? prefixWidget,
    TextAlign? textAlign,
    FocusNode? focusNode,
    int? maxLines,
  }) =>
      CTextFormField(
        height: 56,
        width: width,
        backgroundColor: backgroundColor ?? CColors.mainColor,
        hintText: hintText,
        focusNode: focusNode,
        borderRadius: BorderRadius.circular(6),
        textAlign: textAlign ?? TextAlign.left,
        controller: controller,
        hintStyle: hintStyle,
        style: style,
        maxLines: maxLines,
      );

  factory CTextFormField.search({
    String hintText = LocaleKeys.country_selection_search,
    double? width,
    double? height = 40,
    TextEditingController? controller,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    Function(String)? onChanged,
  }) =>
      CTextFormField(
        height: height,
        width: width,
        backgroundColor: CColors.whiteColor,
        borderColor: CColors.mainColor,
        hintText: hintText,
        borderRadius: BorderRadius.circular(6),
        textAlign: TextAlign.left,
        controller: controller,
        hintStyle: CTextStyles.base.mainColor.s14,
        style: CTextStyles.base.blackColor.s14,
        onChanged: onChanged,
        prefixWidget: (val) => Padding(
          padding: const EdgeInsets.only(left: 14),
          child: CImage(
            // asset: Assets.icons.icSearch,
            width: 14,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
      );

  factory CTextFormField.password(
    String hintText, {
    TextEditingController? controller,
  }) =>
      CTextFormField(
        height: 56,
        backgroundColor: CColors.mainColor,
        hintText: hintText,
        borderRadius: BorderRadius.circular(6),
        textAlign: TextAlign.left,
        controller: controller,
        obscureText: true,
        suffixChangeObscureText: true,
        suffixWidget: (val) => CContainer(
          padding: const EdgeInsets.only(right: 16),
          child: CImage(
            // asset: val ? Assets.icons.icHideEye : Assets.icons.icEye,
            width: 24,
            color: CColors.whiteColor,
          ),
        ),
      );

  @override
  State<CTextFormField> createState() => _CTextFormFieldState();
}

class _CTextFormFieldState extends State<CTextFormField> {
  bool _obscureText = false;
  Color? _borderColor;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.obscureText != null) {
      _obscureText = widget.obscureText!;
    }
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    }

    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _borderColor = widget.borderColorActive;
        } else {
          _borderColor = widget.borderColor;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: CContainer(
        color: widget.backgroundColor,
        borderColor: _borderColor ?? CColors.transparentColor,
        borderRadius: widget.borderRadius,
        borderWidth: 1,
        width: widget.width ?? double.infinity,
        height: widget.height,
        boxShadow: widget.boxShadow,
        onTap: _focusNode.requestFocus,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.prefixWidget != null)
              GestureDetector(
                onTap: () {
                  if (widget.prefixChangeObscureText) {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                },
                child: widget.prefixWidget!(_obscureText),
              ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                obscureText: _obscureText,
                autovalidateMode: AutovalidateMode.always,
                textAlign: widget.textAlign ?? TextAlign.center,
                style: widget.style ?? CTextStyles.base.whiteColor.s14,
                autofocus: widget.autofocus,
                textInputAction: widget.textInputAction,
                enabled: widget.enabled,
                focusNode: _focusNode,
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                onChanged: widget.onChanged,
                onEditingComplete: widget.onEditingComplete,
                onFieldSubmitted: (val) {
                  widget.focusNode?.nextFocus();
                  if (widget.onFieldSubmitted != null) {
                    widget.onFieldSubmitted!(val);
                  }
                  widget.focusNode?.nextFocus();
                },
                decoration: InputDecoration(
                  hintText: widget.hintText?.tr,
                  hintStyle: widget.hintStyle ?? CTextStyles.base.mainColor.s14,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: widget.padding ??
                      const EdgeInsets.symmetric(horizontal: 16),
                  isDense: true,
                ),
              ),
            ),
            if (widget.suffixWidget != null)
              GestureDetector(
                onTap: () {
                  if (widget.suffixChangeObscureText) {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                },
                child: widget.suffixWidget!(_obscureText),
              ),
          ],
        ),
      ),
    );
  }
}
