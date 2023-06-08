import 'dart:convert';

import 'package:clothes_app/app/modules/onboarding/models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpResponse {
  int status;
  String msg;
  SignUpResponse({required this.msg, required this.status});
}

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  RxString selectedGender = 'male'.obs;
  RxBool isSignUp = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  Future<SignUpResponse> signUp(SignupModel signupModel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final data = jsonEncode({
      "name": "${signupModel.name}",
      "email": "${signupModel.email}",
      "password": "${signupModel.password}",
      "birthday": "${signupModel.birthday}",
      "gender": signupModel.gender,
      "height": signupModel.height,
      "weight": signupModel.weight,
    });

    http.Response response = await http.post(
        Uri.parse('http://192.168.1.1:8080/api/auth/register'),
        headers: headers,
        body: data);

    if (response.statusCode == 200) {
      print("SIGN UP SUCCESS");
      return SignUpResponse(
          msg: "SIGN UP SUCCESS", status: response.statusCode);
    } else {
      print(signupModel.birthday);
    }

    return SignUpResponse(msg: response.body, status: response.statusCode);
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }
}
