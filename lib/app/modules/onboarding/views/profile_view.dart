import 'dart:io';

import 'package:clothes_app/app/modules/onboarding/controllers/cart_controller.dart';
import 'package:clothes_app/app/modules/home/controllers/home_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/signup_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/user_model.dart';
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
  final ProfileController _profileController = Get.put(ProfileController());
  final CartController _cartController = Get.put(CartController());
  // late ImagePickerHandler imagePicker;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
        key: _formKey,
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
                        initialValue: _profileController.profile.name,
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
                        onSaved: (newValue) {
                          _profileController.profile.name = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        initialValue: _profileController.profile.email,
                        readOnly: true,
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
                              _profileController.profile.birthday.toString()),
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
                          onSaved: (newValue) {
                            _profileController.profile.birthday =
                                "${newValue!.day}/${newValue.month}/${newValue.year}";
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text('Nam'),
                                leading: Radio(
                                  value: 'male',
                                  groupValue:
                                      _profileController.selectedGender.value,
                                  onChanged: (value) {
                                    _signupController
                                        .selectGender(value.toString());
                                    _profileController.profile.gender = 1;
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
                                  groupValue:
                                      _profileController.selectedGender.value,
                                  onChanged: (value) {
                                    _signupController
                                        .selectGender(value.toString());
                                    _profileController.profile.gender = 0;
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
                                  groupValue:
                                      _profileController.selectedGender.value,
                                  onChanged: (value) {
                                    _signupController
                                        .selectGender(value.toString());
                                    _profileController.profile.gender = 2;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenSize.width * 0.27,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.words,
                              initialValue:
                                  _profileController.profile.height ?? '',
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                labelText: 'Chiều cao',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                } else {
                                  if (int.tryParse(value)! <= 150 ||
                                      int.tryParse(value)! >= 185) {
                                    return 'Chiều cao phải lớn hơn 150cm hoặc nhỏ hơn 185cm';
                                  }
                                }
                              },
                              onSaved: ((newValue) {
                                if (newValue == null || newValue.isEmpty) {
                                  _profileController.profile.height = '';
                                } else {
                                  _profileController.profile.height = newValue;
                                }
                              }),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text('cm'),
                          const Spacer(),
                          SizedBox(
                            width: screenSize.width * 0.27,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.words,
                              initialValue:
                                  _profileController.profile.weight ?? '',
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                labelText: 'Cân nặng',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                } else {
                                  if (int.tryParse(value)! <= 40 ||
                                      int.tryParse(value)! >= 100) {
                                    return 'Cân nặng phải lớn hơn 40kg hoặc nhỏ hơn 100kg';
                                  }
                                }
                              },
                              onSaved: ((newValue) {
                                if (newValue == null || newValue.isEmpty) {
                                  _profileController.profile.weight = '';
                                } else {
                                  _profileController.profile.weight = newValue;
                                }
                              }),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text('kg'),
                        ],
                      ),
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
                                  onPressed: () {
                                    _updateProfile(context);
                                  }),
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
                                  _cartController.productCartList.clear();
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

  void _updateProfile(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      UpdateProfileResponse updateProfileResponse =
          await _profileController.updateProfile(
              _profileController.profile.name.toString(),
              _profileController.profile.birthday.toString(),
              _profileController.profile.gender!.toInt(),
              _profileController.profile.height.toString(),
              _profileController.profile.weight.toString());
      if (updateProfileResponse.status == 200) {
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
                    'Cập nhật thông tin cá nhân thành công',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
          barrierColor: Colors.transparent,
        );
        _profileController.getAndParseProfile();
        _loginController.productListByUser.clear();
        _loginController.productListBySizeUser.clear();
        _loginController.fetchProductByUser();
        _loginController.fetchProductBySizeUser();
      }
    }
  }
}
