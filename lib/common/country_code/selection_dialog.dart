import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../core_ui/themes/c_colors.dart';
import '../../core_ui/themes/c_text_styles.dart';
import '../../core_ui/widgets/c_widget.dart';
import '../../generated/assets.gen.dart';
import '../../generated/locales.g.dart';
import 'country_code.dart';
export 'country_code.dart';

class SelectionDialog extends StatefulWidget {
  const SelectionDialog(
    this.countryCodes, {
    required this.onChoosed,
    this.hideSearch = false,
    Key? key,
  }) : super(key: key);
  final List<CountryCode> countryCodes;
  final Function(CountryCode) onChoosed;
  final bool hideSearch;
  @override
  State<SelectionDialog> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  List<CountryCode> filteredElements = [];

  @override
  void initState() {
    filteredElements = widget.countryCodes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: CText(
            LocaleKeys.country_selection_title,
            style: CTextStyles.base.w500().blackColor,
          ),
        ),
        if (!widget.hideSearch)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: TextField(
              decoration: InputDecoration(
                hintText: LocaleKeys.country_selection_search.tr,
              ),
              onChanged: _filterElements,
            ),
          ),
        Expanded(
          child: ListView(
            children: filteredElements
                .map(
                  (e) => CButton(
                    text: "${e.name}",
                    onTap: () => widget.onChoosed(e),
                    prefixWidget: CImage(
                      asset: AssetGenImage(e.flagUri ?? ""),
                      height: 19,
                      width: 27,
                    ),
                    suffixWidget: CText(
                      e.dialCode,
                      style: CTextStyles.base.setColor(
                        CColors.blackColor.withOpacity(0.6),
                      ),
                    ),
                    color: CColors.transparentColor,
                    backgroundColor: CColors.transparentColor,
                    textStyle: CTextStyles.base.setColor(
                      CColors.blackColor.withOpacity(0.6),
                    ),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.countryCodes
          .where((e) =>
              e.code!.contains(s) ||
              e.dialCode!.contains(s) ||
              TiengViet.parse(e.name!).toUpperCase().contains(s))
          .toList();
    });
  }
}
