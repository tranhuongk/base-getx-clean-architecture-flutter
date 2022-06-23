import '../../generated/fonts.gen.dart';
import 'c_colors.dart';
import 'package:flutter/material.dart';

/// Standardized textstyle
class CTextStyles {
  CTextStyles._();
  static const TextStyle base = TextStyle(
    fontFamily: FontFamily.roboto,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: CColors.buttonWColor,
  );
  static const TextStyle baseOrbitron = TextStyle(
    fontFamily: FontFamily.orbitron,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: CColors.buttonWColor,
  );
}

extension CFontWeight on TextStyle {
  /// FontWeight.w100
  TextStyle w100([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w100,
        fontSize: fontSize,
      );

  /// FontWeight.w200
  TextStyle w200([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w200,
        fontSize: fontSize,
      );

  /// FontWeight.w300
  TextStyle w300([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
      );

  /// FontWeight.w400
  TextStyle w400([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      );

  /// FontWeight.w500
  TextStyle w500([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      );

  /// FontWeight.w600
  TextStyle w600([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );

  /// FontWeight.w700
  TextStyle w700([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      );

  /// FontWeight.w800
  TextStyle w800([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
      );

  /// FontWeight.w900
  TextStyle w900([double? fontSize]) => copyWith(
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
      );
}

extension CFontSize on TextStyle {
  /// custom fontSize
  TextStyle fSize(double fontSize) => copyWith(
        fontSize: fontSize,
      );

  /// fontSize: 10
  TextStyle get s10 => copyWith(
        fontSize: 10,
      );

  /// fontSize: 12
  TextStyle get s12 => copyWith(
        fontSize: 12,
      );

  /// fontSize: 14
  TextStyle get s14 => copyWith(
        fontSize: 14,
      );

  /// fontSize: 16
  TextStyle get s16 => copyWith(
        fontSize: 16,
      );

  /// fontSize: 18
  TextStyle get s18 => copyWith(
        fontSize: 18,
      );

  /// fontSize: 20
  TextStyle get s20 => copyWith(
        fontSize: 20,
      );

  /// fontSize: 24
  TextStyle get s24 => copyWith(
        fontSize: 24,
      );

  /// fontSize: 32
  TextStyle get s32 => copyWith(
        fontSize: 32,
      );

  /// fontSize: 36
  TextStyle get s36 => copyWith(
        fontSize: 36,
      );

  /// fontSize: 40
  TextStyle get s40 => copyWith(
        fontSize: 40,
      );

  /// fontSize: 48
  TextStyle get s48 => copyWith(
        fontSize: 48,
      );
}

extension CFontColor on TextStyle {
  /// custom color
  TextStyle setColor(Color color) => copyWith(color: color);

  /// color: CColors.whiteColor,
  TextStyle get whiteColor => copyWith(color: CColors.whiteColor);

  /// color: CColors.blackColor,
  TextStyle get blackColor => copyWith(color: CColors.blackColor);

  /// color: CColors.grey70Color;
  TextStyle get grey70Color => copyWith(color: CColors.grey70Color);

  /// color: CColors.grey40Color;
  TextStyle get grey40Color => copyWith(color: CColors.grey40Color);

  /// color: CColors.grey100Color;
  TextStyle get grey100Color => copyWith(color: CColors.grey100Color);

  /// color: CColors.mainColor;
  TextStyle get mainColor => copyWith(color: CColors.mainColor);
}

extension CFontStyle on TextStyle {
  /// color: CColors.white,
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension CFontDecoration on TextStyle {
  /// decoration: TextDecoration.overline,
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// decoration: TextDecoration.underline,
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// decoration: TextDecoration.overline,
  TextStyle get noneDecoration => copyWith(decoration: TextDecoration.none);

  /// decoration: TextDecoration.lineThrough,
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}

extension CFontFamily on TextStyle {
  /// fontFamily: "Roboto",
  TextStyle get roboto => copyWith(fontFamily: FontFamily.roboto);

  /// fontFamily: "Orbitron",
  TextStyle get orbitron => copyWith(fontFamily: FontFamily.orbitron);
}

extension CShadow on TextStyle {
  TextStyle shadow(BoxShadow shadow) => copyWith(shadows: [shadow]);
}
