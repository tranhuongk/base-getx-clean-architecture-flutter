import 'dart:io';

import 'package:get/get.dart';
import '../../app/data/providers/local_data/auth_local.dart';
import '../../config/api_endpoint.dart';
import 'api_provider.dart';

enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

class APIRequest {
  String baseUrl;
  String endpoint;
  HTTPMethod method;
  Map<String, String> headers = {
    "Authorization": "Bearer ${AuthLocal.token}",
    "lang-code": Get.locale?.languageCode ?? "vi",
    "version": "1.0",
  };
  Map<String, String>? query;
  dynamic body;
  APIRequest({
    required this.endpoint,
    this.method = HTTPMethod.get,
    Map<String, String> headers = const {
      HttpHeaders.contentTypeHeader: 'application/json'
    },
    this.baseUrl = BaseEndpoint.baseUrl,
    this.query = const {},
    this.body,
  }) {
    this.headers.addAll(headers);
  }

  Future request() => APIProvider.instance.request(this);
}
