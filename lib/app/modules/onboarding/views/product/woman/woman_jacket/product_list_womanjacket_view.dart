import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_womanjacket_controller.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/woman/woman_jacket/product_detail_womanjacket_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWomanJacketView
    extends GetView<ProductListWomanJacketController> {
  final ProductListWomanJacketController _productListWomanJacketController =
      Get.put(ProductListWomanJacketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm nữ', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
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
            'Áo khoác',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemCount: _productListWomanJacketController.productList.length,
              itemBuilder: (context, index) {
                return Container(
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
                            _productListWomanJacketController
                                    .productList[index].image ??
                                'assets/images/product/ao_a1.png',
                            height: 110,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _productListWomanJacketController
                              .productList[index].productName
                              .toString(),
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _productListWomanJacketController
                              .productList[index].price
                              .toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 244, 102, 4),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.to(ProductDetailListWomanJacketView(
                          productId: _productListWomanJacketController
                              .productList[index].productId));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
