// ignore_for_file: prefer_typing_uninitialized_variables
import '../../generated/locales.g.dart';
import 'package:get/get.dart';

import '../logger.dart';

abstract class APIErrors implements Exception {
  final code;
  final message;
  final details;
  final bool showLog;

  APIErrors({
    this.code,
    this.message,
    this.details,
    this.showLog = true,
  }) {
    if (showLog) {
      logger.e(
        details,
        "[$code] $message",
      );
    }
  }

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataError extends APIErrors {
  FetchDataError(String? details, {dynamic code})
      : super(
          code: code ?? LocaleKeys.network_error_fetch_data,
          message: LocaleKeys.network_error_fetch_data.tr,
          details: details ?? LocaleKeys.network_error_fetch_data.tr,
        );
}

class BadRequestError extends APIErrors {
  BadRequestError(String? details, {dynamic code})
      : super(
          code: code ?? LocaleKeys.network_error_invalid_request,
          message: LocaleKeys.network_error_invalid_request.tr,
          details: details ?? LocaleKeys.network_error_invalid_request.tr,
        );
}

class UnauthorizedError extends APIErrors {
  UnauthorizedError(String? details, {dynamic code})
      : super(
          code: code ?? LocaleKeys.network_error_unauthorized,
          message: LocaleKeys.network_error_unauthorized.tr,
          details: details ?? LocaleKeys.network_error_unauthorized.tr,
          showLog: false,
        );
}

class InvalidInputError extends APIErrors {
  InvalidInputError(String? details, {dynamic code})
      : super(
          code: code ?? LocaleKeys.network_error_invalid_input,
          message: LocaleKeys.network_error_invalid_input.tr,
          details: details ?? LocaleKeys.network_error_invalid_input.tr,
        );
}

class InternalServerError extends APIErrors {
  InternalServerError(String? details, {dynamic code})
      : super(
          code: code ?? LocaleKeys.network_error_internal_server_error,
          message: LocaleKeys.network_error_internal_server_error.tr,
          details: details ?? LocaleKeys.network_error_internal_server_error.tr,
        );
}

class TimeOutError extends APIErrors {
  TimeOutError(String? details, {dynamic code})
      : super(
          code: code ?? LocaleKeys.network_error_request_timeout,
          message: LocaleKeys.network_error_request_timeout.tr,
          details: details ?? LocaleKeys.network_error_request_timeout.tr,
        );
}
