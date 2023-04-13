import 'package:clothes_app/app/modules/onboarding/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CartView extends GetView<CartController> {
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Giỏ hàng', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: buildCartPage(context));
  }

  buildCartPage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Deco1.png',
                  width: 120,
                ),
                Column(
                  children: [
                    Text('Quần kaki'),
                    Text(
                      '500000',
                      style: TextStyle(color: Color.fromARGB(255, 244, 102, 4)),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            _cartController
                                .decreaseQuantity(); // Gọi phương thức giảm số lượng trong controller
                          },
                        ),
                        Obx(() => Text(
                            '${_cartController.quantity.value}')), // Hiển thị giá trị số lượng, sử dụng Obx để lắng nghe sự thay đổi của đối tượng quan sát
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            _cartController
                                .increaseQuantity(); // Gọi phương thức tăng số lượng trong controller
                          },
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
