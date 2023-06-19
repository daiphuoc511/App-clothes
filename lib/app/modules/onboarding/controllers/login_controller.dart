import 'dart:convert';
import 'package:clothes_app/app/core/remote_config.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/cart_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/cart_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/login_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_cart_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/token_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class LoginResponse {
  int status;
  String msg;
  LoginResponse({required this.msg, required this.status});
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  late TokenModel token;
  late CartModel cartModel;
  static const String KEY_USER_EMAIL = 'userEmail';
  static const String KEY_USER_TOKEN = 'userToken';
  static const String KEY_PROFILE_ID = 'profileId';
  static int KEY_PRODUCT_ID = 0;

  List productListByUser = <ProductModel>[].obs;
  List productListBySizeUser = <ProductModel>[].obs;

  RxBool isAuthenticated = false.obs;
  RxBool isLogin = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  Future<LoginResponse> login(LoginModel loginModel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    final data = jsonEncode(
        {"email": "${loginModel.email}", "password": "${loginModel.password}"});
    http.Response response = await http.post(
        Uri.parse('${RemoteConfig.config['LOGIN']}'),
        headers: headers,
        body: data);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      token = TokenModel.fromJson(data);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(KEY_USER_EMAIL, loginModel.email.toString());
      sharedPreferences.setString(KEY_USER_TOKEN, token.token.toString());
      isAuthenticated.value = true;

      return LoginResponse(msg: "LOGIN SUCCESS", status: response.statusCode);
    }
    return LoginResponse(msg: response.body, status: response.statusCode);
  }

  Future<void> fetchProductByUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(KEY_USER_TOKEN);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    http.Response response = await http.get(
        Uri.parse('${RemoteConfig.config['PRODUCT_BY_USER']}'),
        headers: headers);

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
        for (var item in list) {
          ProductModel productModel = ProductModel.fromJson(Map.from(item));
          productListByUser.add(productModel);
        }

        update();
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    }
  }

  Future<void> fetchProductBySizeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(KEY_USER_TOKEN);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    http.Response response = await http.get(
        Uri.parse('${RemoteConfig.config['PRODUCT_BY_SIZE_USER']}'),
        headers: headers);

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          List<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
          for (var item in list) {
            ProductModel productModel = ProductModel.fromJson(Map.from(item));
            productListBySizeUser.add(productModel);
          }

          update();
        }
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    }
  }

  ProductModel getProductUserById(int productId) {
    return productListByUser
        .firstWhere((product) => product.productId == productId);
  }

  ProductModel getProductSizeUserById(int productId) {
    return productListBySizeUser
        .firstWhere((product) => product.productId == productId);
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(KEY_USER_TOKEN);
    productListByUser.clear();
    productListBySizeUser.clear();
  }
}
