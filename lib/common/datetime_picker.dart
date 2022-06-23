import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core_ui/themes/c_colors.dart';
import '../core_ui/themes/c_text_styles.dart';
import '../core_ui/widgets/c_widget.dart';
import '../generated/locales.g.dart';

enum DateTimePickerMode { date, time }

mixin DateTimePicker on DialogsMixin {
  cShowDateTimePicker({
    Function(DateTime)? onChoosed,
    DateTime? initialDateTime,
    DateTime? minimumDate,
    DateTime? maximumDate,
    int minimumYear = 1,
    int? maximumYear,
    int minuteInterval = 1,
    bool use24hFormat = true,
    DateTimePickerMode mode = DateTimePickerMode.date,
  }) {
    CupertinoDatePickerMode _mode;
    switch (mode) {
      case DateTimePickerMode.time:
        _mode = CupertinoDatePickerMode.time;
        break;
      default:
        _mode = CupertinoDatePickerMode.date;
        break;
    }
    DateTime _choosedDateTime = initialDateTime ?? DateTime.now();
    bool _isTime = mode == DateTimePickerMode.time;
    CShowDialog(
      margin: EdgeInsets.symmetric(horizontal: _isTime ? 80 : 30),
      child: Column(
        children: [
          CContainer(
            height: 36,
            color: CColors.grey70Color,
            borderColor: CColors.transparentColor,
            child: _isTime
                ? Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CText(
                            "${LocaleKeys.datetime_hour.tr}     ",
                            style: CTextStyles.base.w400(16).blackColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CText(
                          "   ${LocaleKeys.datetime_minute.tr}",
                          style: CTextStyles.base.w400(16).blackColor,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CText(
                            "${LocaleKeys.datetime_day.tr}           ",
                            style: CTextStyles.base.w400(16).blackColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: CText(
                            "${LocaleKeys.datetime_month.tr}       ",
                            style: CTextStyles.base.w400(16).blackColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CText(
                            "        ${LocaleKeys.datetime_year.tr}",
                            style: CTextStyles.base.w400(16).blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          CContainer(
            height: 108,
            borderColor: CColors.transparentColor,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF979797),
                CColors.whiteColor,
                CColors.whiteColor,
                CColors.whiteColor,
                Color(0xFF979797),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            child: CupertinoDatePicker(
              initialDateTime: initialDateTime,
              onDateTimeChanged: (val) => _choosedDateTime = val,
              mode: _mode,
              dateOrder: DatePickerDateOrder.dmy,
              maximumDate: maximumDate,
              maximumYear: maximumYear,
              minimumDate: maximumDate,
              minimumYear: minimumYear,
              minuteInterval: minuteInterval,
              use24hFormat: use24hFormat,
            ),
          ),
          CContainer(
            height: 36,
            color: CColors.grey70Color,
            borderColor: CColors.transparentColor,
            child: Row(
              children: [
                Expanded(
                  child: CButton.inkwell(
                    onTap: () {
                      if (Get.isDialogOpen ?? false) {
                        Get.back();
                      }
                    },
                    child: CText(
                      LocaleKeys.datetime_cancel,
                      style: CTextStyles.base.whiteColor,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  child: CButton.inkwell(
                    onTap: () {
                      if (!(Get.isDialogOpen ?? false)) {
                        return;
                      }
                      if (onChoosed != null) {
                        onChoosed(_choosedDateTime);
                      }
                      Get.back();
                    },
                    child: CText(
                      LocaleKeys.datetime_select,
                      style: CTextStyles.base.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
