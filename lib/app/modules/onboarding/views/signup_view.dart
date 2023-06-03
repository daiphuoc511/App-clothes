import 'package:clothes_app/app/core/utils/validate.dart';
import 'package:clothes_app/app/modules/home/controllers/home_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/signup_model.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

enum Gender { Female, Male, Other }

class SignupView extends GetView<SignupController> {
  final SignupController _signupController = Get.put(SignupController());
  final LoginController _loginController = Get.put(LoginController());
  final HomeController _homeController = Get.put(HomeController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SignupModel data = SignupModel();
  late bool isGender;

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Gender? gender = Gender.Male;

    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background_login.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 150),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: Text(
                              'Đăng ký',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: 'Họ và tên',
                              prefixIcon: const Icon(Icons.account_box,
                                  color: Colors.black, size: 30),
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'Trường này không được để trống';
                              } else {
                                return null;
                              }
                            },
                            onSaved: ((newValue) {
                              data.name = newValue;
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: 'Email',
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.black, size: 30),
                            ),
                            validator: _validateEmail,
                            onSaved: ((newValue) {
                              data.email = newValue?.toLowerCase();
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.lock,
                                  color: Colors.black, size: 30),
                            ),
                            obscureText: true,
                            validator: _validatePassword,
                            onSaved: ((newValue) {
                              data.password = newValue;
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: Visibility(
                            visible: true,
                            child: DateTimeFormField(
                              initialValue: DateTime.now(),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                prefixIcon: Icon(Icons.calendar_today),
                                labelText: 'Ngày tháng năm sinh',
                              ),
                              mode: DateTimeFieldPickerMode.date,
                              dateFormat: DateFormat('dd/MM/yyyy'),
                              onDateSelected: (DateTime value) {
                                // ignore: avoid_print
                                print(
                                    "${value.day}/${value.month}/${value.year}");
                              },
                              onSaved: (newValue) {
                                data.birthday =
                                    "${newValue!.day}/${newValue.month}/${newValue.year}";
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text('Nam'),
                                    leading: Radio(
                                      value: 'male',
                                      groupValue: _signupController
                                          .selectedGender.value,
                                      onChanged: (value) {
                                        _signupController
                                            .selectGender(value.toString());
                                        data.gender = 1;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text('Nữ'),
                                    leading: Radio(
                                      value: 'female',
                                      groupValue: _signupController
                                          .selectedGender.value,
                                      onChanged: (value) {
                                        _signupController
                                            .selectGender(value.toString());
                                        data.gender = 0;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text('Khác'),
                                    leading: Radio(
                                      value: 'other',
                                      groupValue: _signupController
                                          .selectedGender.value,
                                      onChanged: (value) {
                                        _signupController
                                            .selectGender(value.toString());
                                        data.gender = 2;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                fixedSize: const Size(250, 50),
                                primary: const Color.fromARGB(255, 244, 101, 5),
                              ),
                              child: const Text('Đăng ký'),
                              onPressed: () {
                                signup(context);
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 25),
                              child: InkWell(
                                highlightColor:
                                    const Color.fromARGB(255, 124, 125, 126),
                                onTap: () {
                                  _loginController.isLogin.value = true;
                                  _signupController.isSignUp.value = false;
                                  _homeController.currentIndex.value = 2;
                                  Get.toNamed(Routes.HOME);
                                },
                                child: const Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 244, 101, 5),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.only(right: 25),
                              child: InkWell(
                                highlightColor:
                                    const Color.fromARGB(255, 124, 125, 126),
                                onTap: () {
                                  Get.toNamed(Routes.SIGNUP);
                                },
                                child: const Text(
                                  'Quên mật khẩu',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }

  void signup(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    SignUpResponse signUpResponse = await _signupController.signUp(data);
    if (signUpResponse.status == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icon_success.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Đăng ký thành công',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      );
      _loginController.isLogin.value = true;
      _signupController.isSignUp.value = false;
      _homeController.currentIndex.value = 2;
      await Get.toNamed(Routes.HOME);
    } else if (signUpResponse.status == 500) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icon_warning.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Đăng ký không thành công. Vui lòng kiểm tra lại thông tin',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      );
    }
  }

  String? _validateEmail(String? value) {
    try {
      Validate.isEmail(value!);
    } catch (e) {
      return 'Email không đúng định dạng';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    try {
      Validate.isPassword(value!);
    } catch (e) {
      return 'Mật khẩu phải có ít nhất 6 kí tự';
    }
    return null;
  }
}
