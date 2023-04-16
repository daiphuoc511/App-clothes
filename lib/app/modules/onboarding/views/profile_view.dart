import 'dart:io';

import 'package:clothes_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/image_picker_handler.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController _profileController = Get.put(ProfileController());
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
    return Form(
        key: this._formKey,
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
                    child: CircleAvatar(
                      backgroundImage:
                          FileImage(File('assets/images/Deco1.png')),
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
                        height: 10,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: 'Nhập tên của bạn',
                          prefixIcon: Icon(Icons.account_box),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nhập Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: true,
                          child: DropdownButtonFormField(
                            menuMaxHeight:
                                MediaQuery.of(context).size.height / 4,
                            alignment: AlignmentDirectional.centerEnd,
                            items: List<DropdownMenuItem<String>>.generate(
                                100,
                                (int index) => DropdownMenuItem(
                                      value:
                                          "${int.parse(DateFormat.y().format(DateTime.now())) - index}", //added
                                      child: Text(
                                          "${int.parse(DateFormat.y().format(DateTime.now())) - index}"),
                                    )).toList(),
                            decoration: const InputDecoration(
                              labelText: 'Ngày sinh',
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            onChanged: (String? value) {},
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
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width > 600
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5
                                            : 'Đăng xuất'.length * 12.0,
                                        40),
                                    fixedSize: Size(250, 40),
                                    primary:
                                        const Color.fromARGB(255, 244, 101, 5),
                                  ),
                                  child: const Text('Lưu'),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                                        buttonColor: Colors.grey)),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width > 600
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5
                                            : 'Đăng xuất'.length * 12.0,
                                        40),
                                    fixedSize: Size(250, 40),
                                    primary:
                                        const Color.fromARGB(255, 244, 101, 5),
                                  ),
                                  child: const Text('Đăng xuất'),
                                  onPressed: () {
                                    Get.toNamed(Routes.LOGIN);
                                  },
                                )),
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
