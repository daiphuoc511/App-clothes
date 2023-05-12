import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_woman_controller.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/woman/product_detail_listwoman_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWomanView extends GetView<ProductListWomanController> {
  final ProductListWomanController _productListWomanController =
      Get.put(ProductListWomanController());

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
            'Dành cho nữ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            runSpacing: 15,
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
                        child: Image.asset(
                            'assets/images/icon/icon_woman_jacket.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Áo khoác',
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
                        child: Image.asset(
                            'assets/images/icon/icon_woman_tshirt.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Áo thun',
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
                        child: Image.asset(
                            'assets/images/icon/icon_woman_kaki_pant.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Quần tây',
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
                        child: Image.asset(
                            'assets/images/icon/icon_woman_dress.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Đầm',
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
                        child: Image.asset(
                            'assets/images/icon/icon_woman_skirt.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Chân váy',
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
              itemCount: _productListWomanController.productList.length,
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
                            _productListWomanController
                                    .productList[index].image ??
                                'assets/images/product/ao_a1.png',
                            height: 110,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _productListWomanController
                              .productList[index].productName
                              .toString(),
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _productListWomanController.productList[index].price
                              .toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 244, 102, 4),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.to(ProductDetailListWomanView(
                          productId: _productListWomanController
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
