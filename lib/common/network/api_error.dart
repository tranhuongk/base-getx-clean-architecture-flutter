// ignore_for_file: prefer_typing_uninitialized_variables
import '../../generated/locales.g.dart';
import '../logger.dart';
import 'package:get/get.dart';

abstract class APIErrors implements Exception {
  final code;
  final message;
  final details;

  APIErrors({
    this.code,
    this.message,
    this.details,
    bool showLog = true,
  }) {
    if (showLog) {
      logger.e(toString());
    }
  }

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataError extends APIErrors {
  FetchDataError(
    String? details, {
    bool showLog = true,
  }) : super(
          code: LocaleKeys.network_error_fetch_data,
          message: LocaleKeys.network_error_fetch_data.tr,
          details: details ?? LocaleKeys.network_error_fetch_data.tr,
          showLog: showLog,
        );
}

class BadRequestError extends APIErrors {
  BadRequestError(
    String? details, {
    bool showLog = true,
  }) : super(
          code: LocaleKeys.network_error_invalid_request,
          message: LocaleKeys.network_error_invalid_request.tr,
          details: details ?? LocaleKeys.network_error_invalid_request.tr,
          showLog: showLog,
        );
}

class UnauthorizedError extends APIErrors {
  UnauthorizedError(
    String? details, {
    bool showLog = true,
  }) : super(
          code: LocaleKeys.network_error_unauthorized,
          message: LocaleKeys.network_error_unauthorized.tr,
          details: details ?? LocaleKeys.network_error_unauthorized.tr,
          showLog: showLog,
        );
}

class InvalidInputError extends APIErrors {
  InvalidInputError(
    String? details, {
    bool showLog = true,
  }) : super(
          code: LocaleKeys.network_error_invalid_input,
          message: LocaleKeys.network_error_invalid_input.tr,
          details: details ?? LocaleKeys.network_error_invalid_input.tr,
          showLog: showLog,
        );
}

class InternalServerError extends APIErrors {
  InternalServerError(
    String? details, {
    bool showLog = true,
  }) : super(
          code: LocaleKeys.network_error_internal_server_error,
          message: LocaleKeys.network_error_internal_server_error.tr,
          details: details ?? LocaleKeys.network_error_internal_server_error.tr,
          showLog: showLog,
        );
}

class TimeOutError extends APIErrors {
  TimeOutError(
    String? details, {
    bool showLog = true,
  }) : super(
          code: LocaleKeys.network_error_request_timeout,
          message: LocaleKeys.network_error_request_timeout.tr,
          details: details ?? LocaleKeys.network_error_request_timeout.tr,
          showLog: showLog,
        );
}
