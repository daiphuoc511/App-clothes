import 'package:clothes_app/app/modules/onboarding/controllers/mainhome_controller.dart';
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
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                width: 50,
                height: 50,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Deco1.png'),
                  radius: 30,
                ),
              ))
        ],
      ),
      body: buildMainHomePage(context),
    );
  }

  buildMainHomePage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          const Text('Chào mừng'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              style: const TextStyle(color: Colors.black38, fontSize: 16),
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black38,
                  ),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Tìm kiếm'),
            ),
          ),
          const Text('Bộ sưu tập'),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Deco1.png'),
                      radius: 30,
                    ),
                  ),
                  Text('Nam'),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Deco1.png'),
                      radius: 30,
                    ),
                  ),
                  Text('Nữ'),
                ],
              ),
            ],
          ),
          const Text('Sản phẩm'),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: const Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
