import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sksumpc/api/api.dart';
import 'package:sksumpc/api/api_http.dart';
import 'package:sksumpc/components/modals/app_modal.dart';
import 'package:sksumpc/models/account_user.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sksumpc/views/auth/login_screen.dart';
import 'package:sksumpc/views/home_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AuthController extends GetxController {
  final dio = d.Dio();

  var isLoginLoading = false.obs;
  var isRegisterLoading = false.obs;
  var isUsersLoading = false.obs;
  var isUploading = false.obs;

  var users = <UserAccount>[].obs;
  Rx<UserAccount?> user = null.obs;

  final storage = new FlutterSecureStorage();
  Future<void> login({
    required String email,
    required String password,
    required BuildContext parentContext,
  }) async {
    try {
      isLoginLoading(true);
      final response = await ApiHttp().postRequest(
        Api.login,
        {'email': email, 'password': password, 'device_name': 'dasdasd'},
      );

      if (response.data != null) {
        await storage.write(key: 'token', value: response.data);
        Get.offAll(() => const HomeScreen());
      }
      print(response.data);
    } catch (e) {
      AppModal.alert(context: parentContext, message: e.toString());
    } finally {
      isLoginLoading(false);
    }
  }

  Future<void> logout({
    required BuildContext context,
  }) async {
    AppModal.progress(context: context);
    try {
      var token = await storage.read(key: 'token');
      if (token != null) {
        final response = await ApiHttp().postRequest(Api.logout, {
          'logout': 'logout'
        }, headers: {
          'Authorization': 'Bearer $token',
        });

        print(response.data);
        await storage.delete(key: 'token');
      }
      Get.back();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      Get.back();
      AppModal.alert(context: context, message: e.toString());
    }
  }

  void register({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isRegisterLoading(true);
    update();

    try {
      await performRegister(
          context: context, name: name, email: email, password: password);
      isRegisterLoading(false);
      update();
    } catch (e) {
      isRegisterLoading(false);
      update();
      AppModal.alert(context: context, message: e.toString());
    }
  }

  Future<void> performRegister({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await ApiHttp().postRequest(
        Api.register,
        {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      print(response.data);
    } catch (e) {
      throw e; // Rethrow the exception to be caught in login method
    }
  }

  void getUsers() async {
    isUsersLoading(true);
    update();
    d.Response response;
    try {
      response = await ApiHttp().getRequest(Api.getUsers);
      update();
      users((response.data['data'] as List<dynamic>)
          .map((e) => UserAccount.fromMap(e as Map<String, dynamic>))
          .toList());
      isUsersLoading(false);
      update();
    } catch (e) {
      isUsersLoading(false);
      update();
      print(e.toString());
    }
  }

  Future<void> uploadFile(File file) async {
    isUploading(true);
    update();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(Api.testUpload),
    );

    request.files.add(await http.MultipartFile.fromPath(
      'file',
      file.path,
      contentType: MediaType('image', 'jpeg'), // Replace with actual file type
    ));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('File uploaded');
      } else {
        print('File upload failed');
      }
      isUploading(false);
      update();

      // Handle the response as needed
    } catch (e) {
      print(e);
      // Handle any errors
      isUploading(false);
      update();
    }
  }

  Future<void> uploadFileDio(File file) async {
    isUploading(true);
    update();
    try {
      String filename = file.path.split('/').last;

      d.FormData formData = d.FormData.fromMap({
        'file': await d.MultipartFile.fromFile(file.path, filename: filename),
      });

      var response = await ApiHttp().postRequest(Api.testUpload, formData,
          contentType: 'multipart/form-data');

      print(response.data.toString());
      isUploading(false);
      update();
      // Handle the response as needed
    } catch (e) {
      print(e);

      isUploading(true);
      update();
      // Handle any errors
    }
  }
}
