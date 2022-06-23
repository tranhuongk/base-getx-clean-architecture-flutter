import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'common/injection_container.dart';
import 'common/local/hive_services.dart';
import 'common/network/network_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  await HiveServices.init();
  await NetworkChecker.init();

  InjectionContainer.initialRepository();

  runApp(const SenJobApp());
}
