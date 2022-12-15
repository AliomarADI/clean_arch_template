import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

import '../const/server_variables.dart';
import '../utils/cache_keys.dart';
import '../utils/exceptions.dart';
import 'cache.dart';
import 'http.dart';

@Injectable(as: Http)
class HttpImpl implements Http {
  final baseUrl = ServerVariables.baseUrl;
  final Cache cache;

  const HttpImpl({
    required this.cache,
  });

  @override
  Future<dynamic> get(String url, {anotherToken, String query = ''}) async {
    debugPrint('GET ' + url);

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: getHeader(token),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 0);
    }

    return responseJson;
  }

  @override
  Future<dynamic> post(String url, {body, anotherToken}) async {
    debugPrint('POST ' + url);
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: jsonEncode(body),
        headers: getHeader(token),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 0);
    }

    return responseJson;
  }

  @override
  Future<Map<String, dynamic>?> delete(String url, {body, anotherToken}) async {
    debugPrint('POST ' + url);
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final response = await http.delete(
        Uri.parse(baseUrl + url),
        body: jsonEncode(body),
        headers: getHeader(token),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 0);
    }

    return responseJson;
  }

  @override
  Future<Map<String, dynamic>> postMultipartRequest(String url,
      {required List multipartFiles, body, anotherToken}) async {
    debugPrint('POST ' + url);
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(baseUrl + url))
            ..headers.addAll(getFormHeader(token));

      if (body != null) {
        request.fields.addAll(body);
      }

      if (multipartFiles.isNotEmpty) {
        for (int i = 0; i < multipartFiles.length; i++) {
          request.files.add(await http.MultipartFile.fromPath(
            'file',
            multipartFiles.elementAt(i) ?? '',
            contentType: MediaType('image', 'jpeg'),
          ));

          debugPrint('File $i: "file" ${multipartFiles.elementAt(i)}');
        }
      }

      var response = await request.send();
      responseJson = await _response(await http.Response.fromStream(response));
    } on SocketException {
      throw FetchDataException('No Internet connection', 0);
    } catch (e) {
      debugPrint(e.toString());
    }
    return responseJson;
  }

  @override
  Future<Map<String, dynamic>?> put(String url, {body, anotherToken}) async {
    debugPrint('POST ' + url);
    debugPrint(body.toString());

    String? token = await cache.getString(CacheKeys.token);
    dynamic responseJson;

    try {
      final response = await http.put(
        Uri.parse(baseUrl + url),
        body: jsonEncode(body),
        headers: getHeader(token),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', 0);
    }

    return responseJson;
  }

  Map<String, String> getHeader(String? token) {
    return {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Accept-Language': 'ru',
    };
  }

  Map<String, String> getFormHeader(String? token) {
    return {
      'content-type': 'multipart/form-data',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Accept-Language': 'ru',
    };
  }

  dynamic _response(http.Response response) {
    debugPrint("${response.statusCode}");
    debugPrint(response.body.toString());

    dynamic responseJson;

    if (response.body != '') {
      responseJson = json.decode(response.body.toString());
    }

    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 204:
        return responseJson;
      case 400:
        throw BadRequestException(
            _getErrorMessage(responseJson), response.statusCode);
      case 401:
        throw UnauthorizedException(
            _getErrorMessage(responseJson), response.statusCode);
      case 403:
        throw UnauthorizedException(
            _getErrorMessage(responseJson), response.statusCode);
      case 404:
        throw NotFoundException(
            _getErrorMessage(responseJson), response.statusCode);
      case 422:
        throw SystemException(
            _getErrorMessage(responseJson), response.statusCode);
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}: ${response.body}',
            0);
    }
  }

  String _getErrorMessage(dynamic message) {
    return message['error'];
  }
}
