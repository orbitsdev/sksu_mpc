import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sksumpc/models/account_user.dart';
// import 'package:sksumpc/api/api.dart';

class AuthController extends GetxController {
  final dio = d.Dio();

  var isLoginLoading = false.obs;
  var isRegisterLoading = false.obs;
  var isUsersLoading = false.obs;

  var users = <UserAccount>[].obs;

  void login() async {
    isLoginLoading(true);
    update();

    d.Response response;
    // The below request is the same as above.

    try {
      response = await dio.post(
        "http://157.245.146.87/api/login",
        data: {
          'email': 'orbs@gmail.com',
          'password': '@password2!!',
          'device_name': 'opoo1'
        },
      );

      isLoginLoading(false);
      update();

      print(response.data.toString());
    } on DioError catch (e) {
      throw e.message.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } on SocketException catch (e) {
      throw e.toString();
    } catch (e) {
      print(e);
    } finally {
      isLoginLoading(false);
      update();
    }
  }

  void register() async {
    isRegisterLoading(true);
    update();
    d.Response response;

    // The below request is the same as above.

    try {
      response = await dio.post(
        "http://157.245.146.87/api/register",
        data: {
          'name': 'brian',
          'email': 'briaaa@gmail.com',
          'password': '@password2!!'
        },
      );
      isRegisterLoading(false);
      update();

      print(response.data);
    } on DioError catch (e) {
      throw e.message.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } on SocketException catch (e) {
      throw e.toString();
    } catch (e) {
      print(e);
    } finally {
      isRegisterLoading(false);
      update();
    }
  }

  void getUsers() async {
    isUsersLoading(true);
    update();
    d.Response response;

    // The below request is the same as above.

    try {
      response = await dio.get("http://157.245.146.87/api/users");
      isUsersLoading(false);
      update();


    users((response.data['data'] as List<dynamic>).map((e) => UserAccount.fromMap(e as Map<String, dynamic>)).toList());

      // print(response.data.toString());

      print(users.length);
// users((response.data as List<dynamic>).map((e) => UserAccount.fromMap(e as Map<String, dynamic>)).toList());
    } on DioError catch (e) {
      throw e.message.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } on SocketException catch (e) {
      throw e.toString();
    } catch (e) {
      print(e);
    } finally {
      isUsersLoading(false);
      update();
    }
  }
}
