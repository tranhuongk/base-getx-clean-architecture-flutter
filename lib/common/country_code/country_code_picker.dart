import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core_ui/themes/c_colors.dart';
import '../../core_ui/themes/c_text_styles.dart';
import '../../core_ui/widgets/c_dialog.dart';
import '../../core_ui/widgets/c_widget.dart';
import '../../generated/assets.gen.dart';
import 'country_code.dart';
import 'country_codes.dart';
import 'selection_dialog.dart';
export 'country_code.dart';

List<CountryCode> countryCodes =
    codes.map((json) => CountryCode.fromJson(json)).toList();

class CountryCodePicker extends StatefulWidget {
  final ValueChanged<CountryCode>? onChanged;
  // final bool enabled;
  final bool hideSearch;
  final CountryCode? initCountryCode;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  const CountryCodePicker({
    Key? key,
    this.onChanged,
    // this.enabled = true,
    this.hideSearch = false,
    this.initCountryCode,
    this.height = 50,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CountryCodePickerState();
  }
}

class CountryCodePickerState extends State<CountryCodePicker>
    with DialogsMixin {
  CountryCode? selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.initCountryCode != null) {
      selectedItem = widget.initCountryCode;
    } else {
      selectedItem = countryCodes
          .where((element) =>
              element.code?.toLowerCase() == (Get.locale?.countryCode ?? "vn"))
          .first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CButton(
      prefixWidget: CImage(
        asset: AssetGenImage(selectedItem?.flagUri ?? ""),
        height: 19,
        width: 27,
      ),
      padding: widget.padding,
      text: " ${selectedItem?.code}   ${selectedItem?.dialCode}",
      height: widget.height,
      width: widget.width,
      onTap: showCountryCodePickerDialog,
      backgroundColor: CColors.transparentColor,
      color: CColors.transparentColor,
      textStyle: CTextStyles.base.blackColor,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    countryCodes = countryCodes.map((e) => e.localize(context)).toList();
  }

  @override
  void didUpdateWidget(CountryCodePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void showCountryCodePickerDialog() {
    CShowDialog(
      height: 350,
      width: 187,
      transition: DialogTransition.fromLeft,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 30),
      backgroundColor: CColors.grey40Color,
      child: SelectionDialog(
        countryCodes,
        hideSearch: widget.hideSearch,
        onChoosed: _publishSelection,
      ),
    );
  }

  void _publishSelection(CountryCode e) {
    setState(() {
      selectedItem = e;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(e);
    }
    Navigator.pop(context);
  }
}
