import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  filled: true,
  fillColor: Colors.black38,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide.none,
  ),
);

class SignupView extends GetView<SignupController> {
  bool datetime_isnull = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment(0.625, 0),
                    image: AssetImage('assets/images/Bg.jpg'),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: screenHeight / 6,
                    width: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'buttons_sign_up'.tr,
                              style: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text(
                          'title_welcome_sub_title'.tr,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    height: screenHeight / 1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: TextField(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'First Name'.tr,
                              ),
                              controller: controller.firstnameController,
                              //  controller: emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: TextField(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Last Name'.tr,
                              ),
                              controller: controller.lastnameController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Phone'.tr,
                              ),
                              controller: controller.phoneController,
                              //  controller: emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'text_email'.tr,
                              ),
                              controller: controller.emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'text_password'.tr,
                              ),
                              controller: controller.passwordController,
                              obscureText: true,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: GetX<SignupController>(builder: (_) {
                                return Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
                                  child: CheckboxListTile(
                                      title: Text(
                                        'text_agree'.tr,
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.left,
                                      ),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: (_).checkbox_count.value,
                                      activeColor: Colors.white,
                                      checkColor: Colors.black,
                                      onChanged: (value) {
                                        controller.setStateCheckBox(value!);
                                      }),
                                );
                              })),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: SignInButtonBuilder(
                                    text: 'buttons_sign_up'.tr,
                                    backgroundColor: Colors.blueGrey[700]!,
                                    icon: Icons.email,
                                    width: screenWidth/2,
                                    onPressed: () {
                                      controller.createUser(
                                          controller.firstnameController.text,
                                          controller.lastnameController.text,
                                          controller.phoneController.text,
                                          controller.emailController.text,
                                          controller.passwordController.text,
                                          controller.checkbox_count.value);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  child: SignInButtonBuilder(
                                    text: 'Cancel'.tr,
                                    icon: Icons.cancel,
                                    backgroundColor: Colors.blueGrey[700]!,
                                    width: screenWidth/3,
                                    onPressed: () {
                                      Get.toNamed(Routes.LOGIN);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
