import 'dart:async';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../generated/locales.g.dart';
import '../logger.dart';
import 'api_error.dart';
import 'api_request.dart';
import 'base_response.dart';
import 'network_checker.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future request(APIRequest request) async {
    if (!(await NetworkChecker.isConnected)) {
      throw FetchDataError('No Internet connection');
    }
    try {
      logger.i(request.baseUrl);
      logger.i(request.headers);
      logger.i(request.body ?? request.query);
      final response = await _client.request(
        request.baseUrl + request.endpoint,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body ?? request.query,
      );
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutError(null);
    } on SocketException {
      throw FetchDataError(LocaleKeys.network_error_no_network_connection);
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! > 300) {
      // throw FetchDataError(
      //     'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      throw FetchDataError(response.bodyString);
    }
    final _baseResponse = BaseResponse.fromJson(response.body);
    final _message = _baseResponse.messages?.join("\n");

    logger.i(_baseResponse.toJson());

    if (_baseResponse.success ?? false) {
      if (_message?.isNotEmpty ?? false) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess(_message!);
      }
      return _baseResponse.data;
    }

    switch (_baseResponse.status) {
      case 400:
        throw BadRequestError(_message);
      case 401:
      case 403:
        throw UnauthorizedError(_message);
      case 404:
        throw BadRequestError(_message);
      case 500:
        throw InternalServerError(null);
      default:
        throw FetchDataError(_message);
    }
  }
}
