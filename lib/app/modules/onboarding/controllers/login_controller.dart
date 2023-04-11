import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../routes/app_pages.dart';
import '../repository/interface/ilogin_adapter.dart';

class LoginController extends GetxController {
  LoginController({required this.loginRepository});
  final ILoginRepository loginRepository;

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();
  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
    print('Env Url: ' + GlobalConfiguration().getValue('apiUrl'));
  }

  @override
  void onClose() {}

  void login(String userName, String password) async {
    loginRepository.postLogin(userName, password).then((data) {
      loginRepository.saveLoginData(userName, data!.accessToken, data.tokenType,
          data.expiresIn.toString(), true);
      print('Login Success：${data}');
      Get.snackbar('title_login_success'.tr, 'text_login_success'.tr,
          snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(Routes.HOME);
    }, onError: (err) {
      print('Login Fail：${err.toString()}');
      Get.snackbar('title_login_fail'.tr, 'text_login_fail'.tr,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  void logout() {
    loginRepository.resetLoginData();
    Get.toNamed(Routes.LOGIN);
  }

}
