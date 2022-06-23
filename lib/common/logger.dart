import 'package:flutter/foundation.dart' as foundation;
import 'package:logger/logger.dart';

final logger = Logger(
  filter: null,
  // Use the default LogFilter (-> only log in debug mode)
  printer: foundation.kDebugMode ? PrettyPrinter() : null,
  // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);
