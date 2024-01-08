import 'dart:convert';
import 'dart:io';
import 'package:cts_app/data/remote/network/BaseApiService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../AppException.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String url, String token,
      {Map<String, String> addHeaders = const {}}) async {
    dynamic responseJson;
    try {
      Map<String, String> header = Map();
      header['Authorization'] = 'Bearer $token';
      addHeaders.forEach((key, value) {
        header[key] = value;
      });
      debugPrint(baseUrl + url);
      final response =
          await http.get(Uri.parse(baseUrl + url), headers: header);
      debugPrint(response.body);
      responseJson = returnResponse(response);
      // responseJson = jsonDecode(response.body);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(
      String url, Map<String, dynamic> parameters, String token) async {
    Map<String, dynamic> responseJson;
    try {
      Map<String, String> header = {};
      header['Content-Type'] = 'application/json; charset=UTF-8';
      if (token.isNotEmpty) {
        header['Authorization'] = 'Bearer $token';
      }
      debugPrint(baseUrl + url);
      debugPrint(parameters.toString());
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: jsonEncode(parameters),
        headers: header,
      );
      // responseJson = returnResponse(response);
      debugPrint(response.body);
      responseJson = jsonDecode(response.body);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      return e;
    }
    return responseJson;
  }

  @override
  Future putResponse(
      String url, Map<String, dynamic> parameters, String token) async {
    Map<String, dynamic> responseJson;
    try {
      Map<String, String> header = {};
      // header['Content-Type'] = 'application/json; charset=UTF-8';
      header['Content-Type'] = 'application/json';

      header['Authorization'] = 'Bearer $token';
      debugPrint(baseUrl + url);
      final response = await http.put(
        Uri.parse(baseUrl + url),
        body: jsonEncode(parameters),
        headers: header,
      );
      // responseJson = returnResponse(response);
      debugPrint(response.body);
      responseJson = jsonDecode(response.body);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      return e;
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.toString());
      case 404:
        throw UnauthorisedException(response.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
