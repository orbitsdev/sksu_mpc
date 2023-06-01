// http://157.245.146.87/
// Route::post('/login', [AuthApiController::class, 'login'])->name('api.login');
// Route::post('/register', [AuthApiController::class, 'register'])->name('api.register');
// Route::post('/logout', [AuthApiController::class, 'logout'])->name('api.logout');
// Route::post('/create-product', [ProductApiController::class, 'create'])->name('api.product.create');
// Route::post('/delete-product', [ProductApiController::class, 'delete'])->name('api.product.delete');

import 'package:dio/dio.dart';

const String APP_URL = "http://157.245.146.87/";

class Api {
  static Dio _dio = Dio();

  static Dio get dio => _dio;

  static const String login = "${APP_URL}api/login";
  static const String register = "${APP_URL}api/register";
  static const String logout = "${APP_URL}api/logout";
  static const String createProduct = "${APP_URL}api/create-product";
  static const String deleteProduct = "${APP_URL}api/delete-product";
  static const String getUsers = "${APP_URL}api/users";
  static const String testUpload = "${APP_URL}api/test-upload";
  static const String infinitScroll = "${APP_URL}api/post";
}
