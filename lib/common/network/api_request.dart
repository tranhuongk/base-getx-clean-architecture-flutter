import 'package:get/get.dart';
import '../../app/data/providers/local_data/auth_local.dart';
import '../../config/api_endpoint.dart';
import 'api_provider.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

enum HTTPMethod { get, post, delete, put, patch }

class APIRequest {
  String baseUrl = BaseEndpoint.baseUrl;
  String endpoint;
  String contentType;
  HTTPMethod method;
  bool isLogResponse;
  Map<String, String> get headers => {
        "Authorization": "Bearer ${AuthLocal.token ?? AuthLocal.refreshToken}",
        "lang-code": Get.locale?.languageCode ?? "vi",
        "version": "1.0",
        "utc": DateTime.now().timeZoneOffset.toString(),
      };
  Map<String, String>? query;
  dynamic body;

  APIRequest({
    required this.endpoint,
    this.method = HTTPMethod.get,
    Map<String, String> headers = const {},
    this.query = const {},
    this.body,
    this.contentType = "application/json",
    this.isLogResponse = false,
    String? baseUrl,
  }) {
    this.headers.addAll(headers);
    if (baseUrl != null) {
      this.baseUrl = baseUrl;
    }
  }

  Future request() => APIProvider.instance.request(this);
  Future download() => APIProvider.instance.request(this, 0, true);
  // IO.Socket socket() => APIProvider.instance.socket(this);
}
