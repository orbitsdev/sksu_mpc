import 'dart:io';

import 'package:dio/dio.dart' as d;

import 'package:get/get.dart';
import 'package:sksumpc/api/api.dart';
import 'package:sksumpc/api/api_http.dart';
import 'package:sksumpc/models/account_user.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// import 'package:sksumpc/api/api.dart';

class AuthController extends GetxController {
  final dio = d.Dio();

  var isLoginLoading = false.obs;
  var isRegisterLoading = false.obs;
  var isUsersLoading = false.obs;
  var isUploading = false.obs;

  var users = <UserAccount>[].obs;

  void login() async {
    isLoginLoading(true);
    update();

    d.Response response;
    // The below request is the same as above.

    try {
      response = await ApiHttp().postRequest(
        Api.login,
        {
          'email': 'orbs@gmail.com',
          'password': '@password2!!',
          'device_name': 'opoo1'
        },
      );

      isLoginLoading(false);
      update();

      print(response.data.toString());
    } catch (e) {
      isLoginLoading(false);
      update();
    }
  }

  void register() async {
    isRegisterLoading(true);
    update();
    d.Response response;
    try {
      response = await ApiHttp().postRequest(Api.register, {
        'name': 'brian',
        'email': 'kate@gmail.com',
        'password': '@password2!!'
      });
      isRegisterLoading(false);
      update();
      print(response.data.toString());
    } catch (e) {
      isRegisterLoading(false);
      update();
      print(e);
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

    var response = await ApiHttp().postRequest(
      Api.testUpload,
      formData,
      contentType:'multipart/form-data'
    );

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
