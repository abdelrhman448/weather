import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather/core/utils/enums.dart';

import 'exceptions.dart';

class HttpHelper {
  /// TO CALL ANY API [post-get-put-delete]
  Future<dynamic> callService({
    required String url,
    required ResponseType responseType,
    bool authorization = false,
    var parameter,
    bool enumIsMobileOnly = false,
    bool enumIsAll = false,
    bool isMultipart = false,
  }) async {
    http.Response? response;

    try {
      switch (responseType) {
        case ResponseType.post:
          response = await http
              .post(Uri.parse(url), headers: {}, body: jsonEncode(parameter))
              .timeout(const Duration(seconds: 30));
          break;
        case ResponseType.get:
          response = await http
              .get(Uri.parse(url), headers: {})
              .timeout(const Duration(seconds: 30));
          break;
        case ResponseType.put:
          response = await http
              .put(Uri.parse(url), headers: {}, body: jsonEncode(parameter))
              .timeout(const Duration(seconds: 30));
          break;
        case ResponseType.delete:
          response = await http
              .delete(Uri.parse(url), headers: {}, body: jsonEncode(parameter))
              .timeout(const Duration(seconds: 30));
          break;
      }
    } on SocketException {
      throw InternetException('NoInternet connection');
    } on TimeoutException {
      throw TimeoutException('Request timed out');
    }

    return _responseExceptionHandler(response, authorization);
  }

  /// Exception Handler
  dynamic _responseExceptionHandler(http.Response response, bool auth) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 204:
        return {
          "statusCode": 204,
          "statusMessage": null,
          "data": null,
        };
      case 400:
        throw BadRequestException('Bad request: ${response.body}');

      case 401:
        throw UnauthorizedException('Unauthorized: ${response.body}');
      case 403:
        throw ForbiddenException('Forbidden: ${response.body}');
      case 404:
        throw NotFoundException('Not Found: ${response.body}');
      case 409:
        throw ConflictException('Conflict: ${response.body}');
      case 408:
        throw TimeoutException('Request timeout: ${response.body}');
      default:
        throw GeneralException('Unexpected error: ${response.body}');
    }
  }

  void handleException(Exception e) {

    if (e is InternetException) {
      print('Internet error: ${e.message}');
    } else if (e is TimeoutException) {
      print('Timeout error: ${e.message}');
    } else if (e is BadRequestException) {
      print('Bad request error: ${e.message}');
    } else if (e is UnauthorizedException) {
      print('Unauthorized error: ${e.message}');
    } else if (e is ForbiddenException) {
      print('Forbidden error: ${e.message}');
    } else if (e is NotFoundException) {
      print('Not found error: ${e.message}');
    } else if (e is ConflictException) {
      print('Conflict error: ${e.message}');
    } else if (e is GeneralException) {
      print('General error: ${e.message}');
    } else {
      print('Unknown error: $e');
    }
  }
}
