import 'package:clothes_app/app/modules/onboarding/controllers/mainhome_controller.dart';
import 'package:clothes_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeView extends GetView<MainHomeController> {
  final MainHomeController _mainHomeController = Get.put(MainHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 50,
                height: 50,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Deco1.png'),
                  radius: 30,
                ),
              ))
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: buildMainHomePage(context),
    );
  }

  buildMainHomePage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          const Text(
            'Chào mừng Phước',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12, width: 1.0),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black12,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(color: Colors.black12),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Bộ sưu tập',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/icon/icon_man.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Nam',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child:
                            Image.asset('assets/images/icon/icon_woman.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Nữ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Sản phẩm',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: InkWell(
                    highlightColor: const Color.fromARGB(255, 124, 125, 126),
                    child: Column(
                      children: [
                        Container(
                          width: screenSize.width,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 245, 236)),
                          child: Image.asset(
                            'assets/images/Deco1.png',
                            width: screenSize.width,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Quần chi chi đó'),
                        const SizedBox(height: 5),
                        const Text(
                          '500000',
                          style: TextStyle(
                              color: Color.fromARGB(255, 244, 102, 4)),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(Routes.PRODUCTDETAIL);
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
