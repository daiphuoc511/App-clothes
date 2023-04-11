import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController>{
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
                    height: screenHeight / 3,
                    width: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'title_welcome'.tr,
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
                  SizedBox(
                    height: screenHeight / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'text_email'.tr,
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.white, size: 30),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'text_password'.tr,
                              prefixIcon: const Icon(Icons.lock,
                                  color: Colors.white, size: 25),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 3,
                    width: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: SignInButtonBuilder(
                            text: 'buttons_sign_in_email'.tr,
                            icon: Icons.email,
                            onPressed: () {
                            },
                            backgroundColor: Colors.blueGrey[700]!,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'text_no_account'.tr,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                        ),
                      ],
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

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  filled: true,
  fillColor: Colors.black26,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide.none,
  ),
);
