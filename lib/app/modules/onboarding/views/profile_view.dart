import 'dart:io';

import 'package:clothes_app/app/modules/home/controllers/home_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/signup_controller.dart';
import 'package:clothes_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/image_picker_handler.dart';
import '../controllers/profile_controller.dart';
import 'package:date_field/date_field.dart';

class ProfileView extends GetView<LoginController> {
  final LoginController _loginController = Get.put(LoginController());
  final SignupController _signupController = Get.put(SignupController());
  final HomeController _homeController = Get.put(HomeController());
  // late ImagePickerHandler imagePicker;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin tài khoản',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: buildProfilePage(context));
  }

  buildProfilePage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Form(
        onChanged: () {},
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // imagePicker.showDialog(context);
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      backgroundColor: Colors.grey,
                      radius: 80.0,
                    ),
                    // Container(
                    //     width: 140.0,
                    //     height: 140.0,
                    //     child: (_image != null)
                    //         ? CircleAvatar(
                    //             backgroundImage: FileImage(File(_image.path)),
                    //             radius: 80.0,
                    //           )
                    //         : CircleAvatar(
                    //             backgroundImage: model.getProfile.avatarImage,
                    //             radius: 80.0,
                    //           )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Thông tin cá nhân',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        initialValue: _loginController.profile.name,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          labelText: 'Nhập tên của bạn',
                          prefixIcon: Icon(Icons.account_box),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        initialValue: _loginController.profile.email,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          labelText: 'Nhập Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Visibility(
                          visible: true,
                          child: DateTimeFormField(
                            initialValue: DateFormat("dd/MM/yyyy").parse(
                                _loginController.profile.birthday.toString()),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              prefixIcon: Icon(Icons.calendar_today),
                              labelText: 'Ngày tháng năm sinh',
                            ),
                            mode: DateTimeFieldPickerMode.date,
                            dateFormat: DateFormat('dd/MM/yyyy'),
                            onDateSelected: (DateTime value) {
                              print(value);
                            },
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                  buttonTheme: const ButtonThemeData(
                                minWidth: double.infinity,
                                height: 40,
                              )),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(screenSize.width / 3, 50),
                                    primary:
                                        const Color.fromARGB(255, 244, 101, 5),
                                  ),
                                  child: const Text('Lưu'),
                                  onPressed: () {}),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                  buttonTheme: const ButtonThemeData(
                                      minWidth: double.infinity,
                                      height: 40,
                                      buttonColor: Colors.grey)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(screenSize.width / 3, 50),
                                  primary:
                                      const Color.fromARGB(255, 244, 101, 5),
                                ),
                                child: const Text('Đăng xuất'),
                                onPressed: () {
                                  _loginController.logout();
                                  _loginController.isAuthenticated.value =
                                      false;
                                  _loginController.isLogin.value = true;
                                  _signupController.isSignUp.value = false;
                                  _homeController.currentIndex.value = 2;
                                  Get.toNamed(Routes.HOME);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
