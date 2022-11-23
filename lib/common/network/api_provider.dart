import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../logger.dart';
import 'api_error.dart';
import 'api_request.dart';
import 'base_response.dart';
import 'network_checker.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = Dio(
    BaseOptions(sendTimeout: 25000),
  );

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future request(
    APIRequest request, [
    int tryCount = 0,
    bool isDownload = false,
  ]) async {
    if (!(await NetworkChecker.isConnected)) {
      throw FetchDataError('No Internet connection');
    }
    try {
      final url = request.baseUrl + request.endpoint;
      logger.i(
        url,
        "Request │ ${request.method.name.toUpperCase()}",
      );
      logger.i(request.headers, "Headers");
      logger.i(request.body ?? request.query, "Request Parameters");

      late final Directory documents;
      String path = url.substring(url.lastIndexOf("/") + 1);
      String folder = "";

      if (isDownload) {
        if (!(await requestStoragePermission())) {
          throw FetchDataError('Permission is required');
        }
        if (Platform.isIOS) {
          documents = await getApplicationDocumentsDirectory();
          folder = documents.path;
        } else {
          folder = "/storage/emulated/0/download/SEN";
        }

        path = "$folder/$path";

        final type = path.substring(path.lastIndexOf("."));
        if ((await File(path).exists())) {
          int x = 0;

          do {
            x += 1;
          } while ((await File(path.replaceAll(type, "($x)$type")).exists()));

          path = path.replaceAll(type, "($x)$type");
        }
        logger.i(path, "Save Path");
      }

      final response = isDownload
          ? await _client.download(
              url,
              path,
              data: request.body ?? request.query,
              options: Options(
                contentType: request.contentType,
                headers: request.headers,
                method: request.method.name.toUpperCase(),
              ),
              queryParameters: request.query,
            )
          : await _client.request(
              url,
              data: request.body ?? request.query,
              options: Options(
                contentType: request.contentType,
                headers: request.headers,
                method: request.method.name.toUpperCase(),
              ),
              queryParameters: request.query,
            );
      if (isDownload) {
        return path;
      }
      return _returnResponse(response, request, tryCount);
    } on TimeoutException catch (_) {
      throw TimeOutError(
        _.message,
        code: _.message,
      );
    } on SocketException catch (_) {
      throw FetchDataError(
        _.message,
        code: _.message,
      );
    } catch (e) {
      throw FetchDataError(
        e.toString(),
        code: e.toString(),
      );
    }
  }

  // IO.Socket socket(APIRequest request) {
  //   // if (!(await NetworkChecker.isConnected)) {
  //   //   throw FetchDataError('No Internet connection');
  //   // }
  //   logger.i(
  //     request.baseUrl + request.endpoint,
  //     request.method.name.toUpperCase(),
  //   );
  //   logger.i(
  //     request.body,
  //     "opts",
  //   );

  //   return IO.io(
  //     request.baseUrl,
  //     request.body,
  //   );
  // }

  dynamic _returnResponse(
    Response<dynamic> response,
    APIRequest req,
    int tryCount,
  ) async {
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! > 300) {
      // throw FetchDataError(
      //     'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      throw FetchDataError(
        response.data,
        code: response.statusCode,
      );
    }
    if (response.data is! Map) {
      return response.data;
    }
    final baseResponse = BaseResponse.fromJson(Map.from(response.data));
    final message = baseResponse.messages?.join("\n");

    logger.v(
      req.isLogResponse ? response.data : "No Log",
      "Response │ ${req.method.name.toUpperCase()} | Status: ${baseResponse.status}\n${req.baseUrl + req.endpoint}",
    );

    if (baseResponse.success ?? false) {
      return baseResponse.data;
    }

    switch (baseResponse.status) {
      case 400:
        throw BadRequestError(message, code: baseResponse.status);
      case 401:
      case 403:
        // if (tryCount == 0 && AuthLocal.token != null) {
        //   RefreshTokenUsecase refreshTokenUsecase = getx.Get.find();
        //   final res = await refreshTokenUsecase();
        //   if (res.isRight()) {
        //     return await request(req, 1);
        //   } else {
        //     pleaseLogin();
        //   }
        // } else {
        //   pleaseLogin();
        // }
        throw UnauthorizedError(message, code: baseResponse.status);
      case 404:
        throw BadRequestError(message, code: baseResponse.status);
      case 500:
        throw InternalServerError(message, code: baseResponse.status);
      default:
        throw FetchDataError(message, code: baseResponse.status);
    }
  }
}

Future<bool> requestStoragePermission() async {
  if (Platform.isAndroid) {
    if (!(await Permission.storage.request()).isDenied &&
        // access media location needed for android 10/Q
        !(await Permission.accessMediaLocation.request()).isDenied &&
        // manage external storage needed for android 11/R
        !(await Permission.manageExternalStorage.request()).isDenied) {
      return true;
    } else {
      return false;
    }
  }
  // if (Platform.isIOS) {
  //   if (await _requestPermission()) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // } else {
  //   // not android or ios
  //   return false;
  // }
  return true;
}
