// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../common/logger.dart';
import '../../../core_ui/themes/c_colors.dart';
import '../../../core_ui/themes/c_text_styles.dart';
import '../../../core_ui/widgets/c_widget.dart';
import '../../../generated/assets.gen.dart';

class CItemRadio extends StatefulWidget {
  final Color? colorRadio;
  final Color? borderColor;
  final Color? checkColor;
  final Color? backgroundColor;
  final double? sizeRadio;
  final double? sizeImage;
  final VoidCallback? onTap;
  final EdgeInsets? paddingText;
  final String? textWidgetImage;
  final double? height;
  final double? width;
  final Color? borderContainer;
  final double? radiusContainer;
  final String? imRadio;
  bool? isChecked;

  CItemRadio({
    Key? key,
    this.borderColor,
    this.colorRadio,
    this.sizeRadio,
    this.sizeImage,
    this.onTap,
    this.checkColor,
    this.isChecked,
    this.paddingText,
    this.textWidgetImage,
    this.height,
    this.backgroundColor,
    this.width,
    this.borderContainer,
    this.radiusContainer,
    this.imRadio,
  }) : super(key: key);

  @override
  State<CItemRadio> createState() => _CItemRadioState();
}

class _CItemRadioState extends State<CItemRadio> {
  @override
  void initState() {
    widget.isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.textWidgetImage != null
        ? CContainer(
            width: widget.width ?? 170,
            height: widget.height ?? 48,
            color: widget.backgroundColor ?? CColors.grey70Color,
            borderColor: widget.borderContainer ?? CColors.blackColor,
            borderRadius: BorderRadius.circular(widget.radiusContainer ?? 25),
            onTap: () {
              setState(() {
                widget.isChecked = !widget.isChecked!;
                logger.d(widget.isChecked);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: widget.onTap ??
                        () {
                          setState(() {
                            widget.isChecked = !widget.isChecked!;
                            logger.d(widget.isChecked);
                          });
                        },
                    child: Container(
                      height: widget.sizeRadio ?? 14,
                      width: widget.sizeRadio ?? 14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: widget.borderColor ?? CColors.cym1Color,
                          ),
                          color: widget.isChecked ?? false
                              ? widget.borderColor ?? CColors.cym1Color
                              : widget.backgroundColor),
                    ),
                  ),
                  SizedBox(
                    width: 0.6 * (widget.width ?? 170),
                    child: CText('Nha phat trien asdadadsd',
                        textOverflow: null, style: CTextStyles.base.w400(14)),
                  ),
                  Row(
                    children: [
                      CText(widget.textWidgetImage,
                          style: CTextStyles.base.w400(12)),
                      CImage(
                        asset: widget.imRadio ?? Assets.icons.icArrowRight,
                        width: widget.sizeImage ?? 16,
                        height: widget.sizeImage ?? 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : CContainer(
            width: widget.width ?? 170,
            height: widget.height ?? 48,
            color: widget.backgroundColor ?? CColors.grey70Color,
            borderColor: widget.borderContainer ?? CColors.blackColor,
            borderRadius: BorderRadius.circular(widget.radiusContainer ?? 25),
            onTap: () {
              setState(() {
                widget.isChecked = !widget.isChecked!;
                logger.d(widget.isChecked);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: widget.onTap ??
                        () {
                          setState(() {
                            widget.isChecked = !widget.isChecked!;
                            logger.d(widget.isChecked);
                          });
                        },
                    child: Container(
                      height: widget.sizeRadio ?? 14,
                      width: widget.sizeRadio ?? 14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: widget.borderColor ?? CColors.cym1Color,
                          ),
                          color: widget.isChecked ?? false
                              ? widget.borderColor ?? CColors.cym1Color
                              : widget.backgroundColor),
                    ),
                  ),
                  SizedBox(
                    width: 0.6 * (widget.width ?? 170),
                    child: CText('Nha phat trien asdadadsd',
                        textOverflow: null, style: CTextStyles.base.w400(14)),
                  ),
                  CImage(
                    asset: widget.imRadio ?? Assets.icons.icArrowRight,
                    width: widget.sizeImage ?? 16,
                    height: widget.sizeImage ?? 16,
                  ),
                ],
              ),
            ),
          );
  }
}
