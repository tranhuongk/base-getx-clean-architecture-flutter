import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../common/country_code/country_code.dart';
import '../../common/country_code/country_code_picker.dart';
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
  final BorderRadius borderRadius;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final TextStyle? hintStyle;

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
  }) : super(key: key);

  factory CTextFormField.telephone(
    String hintText, {
    double? width,
    double? height,
    TextEditingController? controller,
    BorderRadius? borderRadius,
    EdgeInsets? margin,
    Color? backgroundColor = CColors.grey40Color,
    BoxShadow? boxShadow,
    TextStyle? hintStyle,
    Widget? prefixWidget,
    TextAlign? textAlign,
    Function(CountryCode)? onCountryCodeChanged,
  }) =>
      CTextFormField(
        height: 50,
        width: width,
        backgroundColor: backgroundColor,
        hintText: hintText.tr,
        borderRadius: BorderRadius.circular(25),
        textAlign: textAlign,
        controller: controller,
        hintStyle: hintStyle,
        prefixWidget: (val) => Row(
          children: [
            CountryCodePicker(
              onChanged: onCountryCodeChanged,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            Container(
              width: 1,
              height: 30,
              color: CColors.grey55Color,
            ),
          ],
        ),
      );

  factory CTextFormField.password(
    String hintText, {
    double? width,
    double? height,
    TextEditingController? controller,
    Color? backgroundColor,
    TextStyle? hintStyle,
    Widget? prefixWidget,
    TextAlign? textAlign,
    bool obscureText = true,
  }) =>
      CTextFormField(
        height: 50,
        width: width,
        obscureText: obscureText,
        backgroundColor: backgroundColor ?? CColors.whiteColor,
        hintText: hintText.tr,
        borderRadius: BorderRadius.circular(25),
        textAlign: textAlign,
        controller: controller,
        hintStyle: hintStyle,
        prefixChangeObscureText: true,
        prefixWidget: (val) => Row(
          children: [
            CContainer(
              padding: const EdgeInsets.only(left: 20, right: 31),
              child: CImage(
                asset: val ? Assets.icons.icHideEye : Assets.icons.icEye,
                width: 24,
                color: CColors.blackColor,
              ),
            ),
            Container(
              width: 1,
              height: 30,
              color: CColors.grey55Color,
            ),
          ],
        ),
      );

  @override
  State<CTextFormField> createState() => _CTextFormFieldState();
}

class _CTextFormFieldState extends State<CTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    if (widget.obscureText != null) {
      _obscureText = widget.obscureText!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: CContainer(
        color: widget.backgroundColor,
        borderColor: widget.backgroundColor ?? CColors.transparentColor,
        borderRadius: widget.borderRadius,
        width: widget.width ?? double.infinity,
        height: widget.height,
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
                style: CTextStyles.base.blackColor,
                autofocus: widget.autofocus,
                enabled: widget.enabled,
                focusNode: widget.focusNode,
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
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle ?? CTextStyles.base.grey70Color,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
