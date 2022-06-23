import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class _CupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      CustomCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(_CupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'CustomCupertinoLocalizations.delegate(en_US)';
}

class CustomCupertinoLocalizations with CupertinoLocalizations {
  const CustomCupertinoLocalizations();
  static const List<String> _months = <String>[
    '            1            ',
    '            2            ',
    '            3            ',
    '            4            ',
    '            5            ',
    '            6            ',
    '            7            ',
    '            8            ',
    '            9            ',
    '            10            ',
    '            11            ',
    '            12            ',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => "$hour  ";

  @override
  String datePickerHourSemanticsLabel(int hour) => "$hour";

  @override
  String datePickerMinute(int minute) => "  ${minute.toString().padLeft(2, '0')}";

  @override
  String? datePickerMinuteSemanticsLabel(int minute) {
    return "$minute";
  }

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
        const CustomCupertinoLocalizations());
  }

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _CupertinoLocalizationsDelegate();

  @override
  String get anteMeridiemAbbreviation => "AM";
  @override
  String get postMeridiemAbbreviation => "PM";

  @override
  String get copyButtonLabel => throw UnimplementedError();

  @override
  String get cutButtonLabel => throw UnimplementedError();

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.dmy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_dayPeriod_time;

  @override
  String datePickerMediumDate(DateTime date) {
    throw UnimplementedError();
  }

  @override
  String get modalBarrierDismissLabel => throw UnimplementedError();

  @override
  String get pasteButtonLabel => throw UnimplementedError();

  @override
  String get searchTextFieldPlaceholderLabel => throw UnimplementedError();

  @override
  String get selectAllButtonLabel => throw UnimplementedError();

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    throw UnimplementedError();
  }

  @override
  String timerPickerHour(int hour) {
    throw UnimplementedError();
  }

  @override
  String? timerPickerHourLabel(int hour) {
    throw UnimplementedError();
  }

  @override
  List<String> get timerPickerHourLabels => throw UnimplementedError();

  @override
  String timerPickerMinute(int minute) {
    throw UnimplementedError();
  }

  @override
  String? timerPickerMinuteLabel(int minute) {
    throw UnimplementedError();
  }

  @override
  List<String> get timerPickerMinuteLabels => throw UnimplementedError();

  @override
  String timerPickerSecond(int second) {
    throw UnimplementedError();
  }

  @override
  String? timerPickerSecondLabel(int second) {
    throw UnimplementedError();
  }

  @override
  List<String> get timerPickerSecondLabels => throw UnimplementedError();

  @override
  String get todayLabel => throw UnimplementedError();

  @override
  String get alertDialogLabel => throw UnimplementedError();
}
