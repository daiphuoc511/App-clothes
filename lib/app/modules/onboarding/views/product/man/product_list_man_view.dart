import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../controllers/product/man/product_list_man_controller.dart';

class ProductListManView extends GetView<ProductListManController> {
  final ProductListManController _productListManController =
      Get.put(ProductListManController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Sản phẩm nam', style: TextStyle(color: Colors.black)),
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
            'Dành cho nam',
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
              itemCount: _productListManController.productList.length,
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
                            _productListManController
                                    .productList[index].image ??
                                'assets/images/product/ao_a1.png',
                            height: 110,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(_productListManController
                            .productList[index].productName
                            .toString()),
                        const SizedBox(height: 5),
                        Text(
                          _productListManController.productList[index].price
                              .toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 244, 102, 4)),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(Routes.PRODUCTDETAIL);
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
