import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('Env Url: ' + GlobalConfiguration().getValue('apiUrl'));
  }

  @override
  void onClose() {}

  void login(String userName, String password) async {}

  void logout() {
    Get.toNamed(Routes.LOGIN);
  }
}
