import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/c_text_styles.dart';

class CText extends StatelessWidget {
  final double? width;
  final GestureTapCallback? onTap;
  final String? text;
  final EdgeInsets padding;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Gradient? gradient;

  const CText(
    this.text, {
    Key? key,
    this.textOverflow,
    this.padding = EdgeInsets.zero,
    this.style = CTextStyles.base,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.width,
    this.maxLines,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _text = Text(
      (text ?? '').tr,
      textAlign: textAlign,
      style: style?.copyWith(
        foreground: gradient != null
            ? (Paint()
              ..shader = gradient?.createShader(
                const Rect.fromLTWH(100, 0, 200, 0),
              ))
            : null,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: _text,
      ),
    );
  }
}
