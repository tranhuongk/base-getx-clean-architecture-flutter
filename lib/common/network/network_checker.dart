import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class NetworkChecker {
  static Rx<ConnectivityResult> connectivityResult =
      ConnectivityResult.none.obs;

  static Future<void> init() async {
    connectivityResult.value = await (Connectivity().checkConnectivity());
    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult.value = event;
    });
  }

  static Future<bool> get isConnected async {
    Connectivity().checkConnectivity().then(connectivityResult);
    return (connectivityResult.value == ConnectivityResult.mobile ||
        connectivityResult.value == ConnectivityResult.wifi);
  }
}
