import 'dart:developer';

import 'package:base_app_flutter/common/local/hive_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/common.dart';
import 'config/routes/app_pages.dart';
import 'generated/locales.g.dart';

class SenJobApp extends StatelessWidget {
  const SenJobApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log("Your device locale: ${Get.deviceLocale}");
    return GestureDetector(
      // Dismiss keyboard when clicked outside
      onTap: Common.dismissKeyboard,
      child: GetMaterialApp(
        // builder: (context, child) => ResponsiveWrapper.builder(
        //   child,
        //   defaultScaleFactor: 1.2,
        //   maxWidth: 1200,
        //   minWidth: 450,
        //   defaultScale: true,
        //   breakpoints: [
        //     const ResponsiveBreakpoint.resize(450, name: MOBILE),
        //     const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
        //     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
        //     const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        //     const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        //     const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        //   ],
        //   background: const ColoredBox(color: AppColors.white),
        // ),
        initialRoute: AppRoutes.login,
        // theme: AppThemes.themData,
        getPages: AppPages.pages,
        locale: HiveServices.languageCode,
        translationsKeys: AppTranslation.translations,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
