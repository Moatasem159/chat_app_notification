import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:group_chat_app/core/remote/app_interceptors.dart';
import 'package:group_chat_app/core/remote/end_points.dart';
import 'package:group_chat_app/core/remote/handling_errors.dart';
import 'package:group_chat_app/core/remote/status_code.dart';
class DioConsumer{
 static late final Dio _dio;
 static init(){
  _dio=Dio();
  HttpClient client=HttpClient();
  (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };
  _dio.options..headers={
    "Authorization":"key= AAAAskuSbhc:APA91bESNQxBrgCBvISev_2xRDNkpxE7hgmAftyuQs5hZIA0hnKLgLlGQHiG9ooTxvQtoCsR2la9BDWesq8W_2Fliads9jU6BMb7LlE4FagBvtj-9Ww_sSmasgpty8yorBk6YATL9cCE",
  "Content-Type":"application/json"
  }
    ..baseUrl = EndPoints.baseUrl
    ..responseType = ResponseType.plain
    .. receiveDataWhenStatusError= true
    ..followRedirects = false
    ..validateStatus = (status) {
      return status! < StatusCode.internetServerError;
    };
  _dio.interceptors.add(AppInterceptors());
  if (kDebugMode) {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }
 }
  static Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }
  static Future post(String url, {Map<String, dynamic>? body,bool formDataIsEnabled = false}) async {
    try {
      final response = await _dio.post(url, data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }
  static  Future put(String url, {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.put(url,data: body);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      HandlingErrors.handleDioError(error);
    }
  }
  static Future delete(String url, {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.delete(url, data: body);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
     HandlingErrors.handleDioError(error);
    }
  }
}