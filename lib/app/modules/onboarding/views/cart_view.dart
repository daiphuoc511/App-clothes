import 'package:clothes_app/app/modules/onboarding/controllers/cart_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';

class CartView extends GetView<CartController> {
  final CartController _cartController = Get.put(CartController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Obx(
        () => _loginController.isAuthenticated.value
            ? buildCartPageUser(context)
            : buildCartPage(context),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(0),
                color: Colors.white,
                width: screenSize.width * 0.65,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Tổng thanh toán',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              color: Color.fromARGB(255, 244, 102, 4),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            onTap: () {},
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(0),
                color: const Color.fromARGB(255, 244, 101, 5),
                width: screenSize.width * 0.35,
                height: 60,
                child: const Center(
                    child: Text(
                  'Mua ngay',
                  textScaleFactor: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ))),
            onTap: () {
              Get.toNamed(Routes.ORDER);
            },
          ),
        ],
      ),
    );
  }

  buildCartPageUser(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Obx(
        () => ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _cartController.productCartList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    _cartController.productCartList[index].productModel.image
                        .toString(),
                    width: 120,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(_cartController
                          .productCartList[index].productModel.productName
                          .toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _cartController.productCartList[index].productPrice
                            .toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 244, 102, 4)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              _cartController.decreaseQuantity();
                            },
                          ),
                          Obx(() => Text(
                              '${_cartController.productCartList[index].quantity}')),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              _cartController.increaseQuantity();
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  buildCartPage(BuildContext context) {
    return const Text('Bạn vui lòng đăng nhập');
  }
}
