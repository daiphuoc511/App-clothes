import 'package:clothes_app/app/modules/onboarding/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class OrderView extends GetView<OrderController> {
  final OrderController _cartController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: buildCartPage(context),
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
                            '500000',
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
                  'Đặt hàng',
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

  buildCartPage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/product/ao_a1.png',
                  width: 120,
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: const [
                    Text(
                      'Áo khoác nỉ',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '500000',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Color.fromARGB(255, 244, 102, 4)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Số lượng: 1'),
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
