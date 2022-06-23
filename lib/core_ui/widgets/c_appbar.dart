// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final Widget? leading;
  final Widget? flexibleSpace;

  const WidgetAppBar(
      this.backgroundColor,
      this.textIconColor,
      this.icon,
      this.title,
      this.height,
      this.menuItem,
      this.hideBack,
      this.leading,
      this.flexibleSpace);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: menuItem,
      toolbarHeight: preferredSize.height,
      leading: leading,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textIconColor,
        ),
      ),
      flexibleSpace: flexibleSpace,
      backgroundColor: backgroundColor,
    );
  }
}
