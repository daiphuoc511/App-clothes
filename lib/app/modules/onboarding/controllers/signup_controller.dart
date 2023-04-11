import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../repository/interface/isignup_adapter.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController firstnameController =
      TextEditingController(text: '');
  final TextEditingController lastnameController =
      TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');

  RxBool checkbox_count = false.obs;

  SignupController({required this.signupRepository});
  final ISignupRepository signupRepository;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void createUser(String first_name, String last_name, String phone,
      String email, String password, bool term) async {
    String termString;
    if (term == false) {
      termString = 'not checked';
      Get.snackbar('error_error'.tr, 'text_un_agree'.tr,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      return;
    } else
      termString = 'checked';
      signupRepository
          .postSignup(first_name, last_name, phone, email, password, termString)
          .then((data) {
        Get.snackbar('text_login_success'.tr, 'text_login_success'.tr,
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
        //Get.toNamed(Routes.HOME);
        Get.toNamed(Routes.LOGIN);
    }, onError: (err) {
      Get.snackbar('title_register_fail'.tr, 'text_register_fail'.tr,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    });
  }

  void setStateCheckBox(bool value) {
    checkbox_count.value = value;
  }
}
