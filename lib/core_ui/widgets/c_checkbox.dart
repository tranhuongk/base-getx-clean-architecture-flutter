import 'package:flutter/material.dart';

import '../core_ui.dart';
import '../themes/c_colors.dart';

class CCheckBox extends StatefulWidget {
  final Color? bgColor;
  final Color? iconColor;
  final double? sizeBox;
  final double? sizeIcon;
  final VoidCallback? onTap;
  bool? isChecked;

  CCheckBox(
      {Key? key,
      this.iconColor,
      this.bgColor,
      this.sizeBox,
      this.sizeIcon,
      this.onTap,
      this.isChecked})
      : super(key: key);

  @override
  State<CCheckBox> createState() => _CCheckBoxState();
}

class _CCheckBoxState extends State<CCheckBox> {
  @override
  void initState() {
    widget.isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CContainer(
        height: widget.sizeBox ?? 16,
        width: widget.sizeBox ?? 16,
        borderRadius: BorderRadius.circular(2),
        onTap: widget.onTap ??
            () {
              setState(() {
                widget.isChecked = !widget.isChecked!;
              });
            },
        color: widget.bgColor ?? CColors.bgColorLight,
        child: Icon(
          Icons.check,
          size: widget.sizeIcon ?? 12,
          color: widget.isChecked ?? false
              ? widget.iconColor ?? CColors.buttonWColor
              : widget.bgColor ?? CColors.bgColorLight,
        ));
  }
}
