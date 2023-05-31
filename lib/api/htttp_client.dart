import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio();
    // You can configure the Dio instance here, such as adding interceptors, default headers, etc.
    // For example: _dio.interceptors.add(someInterceptor);
  }

  Dio get dio => _dio;

  Future<Response> getRequest(String url, {Map<String, dynamic>? headers}) async {
    Options options = Options(headers: headers);
    try {
      Response response = await _dio.get(url, options: options);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<Response> postRequest(String url, dynamic data, {Map<String, dynamic>? headers}) async {
    Options options = Options(headers: headers);
    try {
      Response response = await _dio.post(url, data: data, options: options);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Rest of the code...
}
