import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:demo_app/core/network/constants/network_constants.dart';
import 'package:demo_app/core/network/models/api_exception.dart';
import 'package:demo_app/core/network/models/api_response_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// created by: yazeed nasrullah
/// email: yazeed.mohm97@gmail.com

class HttpClient {
  final http.Response _timeoutResponse = http.Response('Timeout', HttpStatus.networkConnectTimeoutError);

  Future<ApiResponseHandler> get({required String endPoint}) async {
    try {
      final response = await http
          .get(Uri.parse(endPoint), headers: NetworkConstants.headers)
          .timeout(const Duration(minutes: 1), onTimeout: () => _responseHandler(_timeoutResponse));

      return _responseHandler(response);
    } on TimeoutException catch (_) {
      return _responseHandler(_timeoutResponse);
    } catch (ex) {
      return _responseHandler(http.Response(ex.toString(), 9999));
    }
  }

  Future<dynamic> post<T>({required String endPoint, dynamic payload}) async {
    try {
      final response = await http
          .post(Uri.parse(endPoint), headers: NetworkConstants.headers, body: jsonEncode(payload))
          .timeout(const Duration(seconds: 30), onTimeout: () => _responseHandler(_timeoutResponse));

      return _responseHandler(response);
    } on TimeoutException catch (_) {
      return _responseHandler(_timeoutResponse);
    } catch (ex) {
      return _responseHandler(http.Response(ex.toString(), 9999));
    }
  }

  _responseHandler(http.Response response) {
    if (kDebugMode) {
      log('____________________________________________________');
      log('${response.request?.headers}');
      log('${response.request?.url.toString()}: ${response.statusCode.toString()}');
      log(response.body);
      log('____________________________________________________');
    }

    ///you should enable this line
    // return ApiResponseHandler(statusCode: response.statusCode, response: _handleBody(response));

    ///for test -->
    return ApiResponseHandler(statusCode: HttpStatus.ok, response: _handleBody(response));
  }

  _handleBody(http.Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else if (response.statusCode < 500) {
      return apiExceptionFromJson(response.body);
    } else {
      return 'Unexpected Error';
    }
  }
}
