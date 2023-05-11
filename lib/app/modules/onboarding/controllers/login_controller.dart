import 'dart:convert';

import 'package:clothes_app/app/modules/onboarding/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import '../../../routes/app_pages.dart';

class LoginResponse {
  int status;
  String msg;
  LoginResponse({required this.msg, required this.status});
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

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
        Uri.parse('http://192.168.1.1:8080/api/auth/login'),
        headers: headers,
        body: data);

    if (response.statusCode == 200) {
      print("LOGIN SUCCESS");
    }
    return LoginResponse(msg: response.body, status: response.statusCode);
  }

  void logout() {
    Get.toNamed(Routes.LOGIN);
  }
}
