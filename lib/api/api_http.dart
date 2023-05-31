import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class ApiHttp {
  late Dio _dio;

  ApiHttp() {
    _dio = Dio();
  }

  Future<Response> getRequest(String url,
      {Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(url, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      // Handle Dio specific errors
      throw e;
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      throw e.toString();
    } on SocketException catch (e) {
      // Handle socket connection errors
      throw e;
    } catch (e) {
      // Handle generic errors
      throw e;
    } 
  }

  Future<Response> postRequest(String url, dynamic data,
      {Map<String, dynamic>? headers, String? contentType}) async {
    try {
      final response =
          await _dio.post(url, data: data, options: Options(
             contentType: contentType,
            headers: headers,
            ));
      return response;
    } on DioError catch (e) {
      // Handle Dio specific errors
      throw e.message.toString();
    } on PlatformException catch (e) {
      // Handle platform-specific errors
      throw e.toString();
    } on SocketException catch (e) {
      // Handle socket connection errors
      throw e.toString();
    } catch (e) {
      // Handle generic errors
      throw e.toString();
    } finally {
      // Perform cleanup or additional actions
    }
  }
}
