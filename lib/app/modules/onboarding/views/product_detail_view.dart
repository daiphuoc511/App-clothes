import 'package:clothes_app/app/modules/onboarding/controllers/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  final ProductDetailController _productDetailController =
      Get.put(ProductDetailController());

  ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: buildProductDetailPage(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(0),
                color: Colors.white,
                width: screenSize.width * 0.4,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart),
                    Text('Thêm vào giỏ hàng'),
                  ],
                )),
            onTap: () {},
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.all(0),
                color: const Color.fromARGB(255, 244, 101, 5),
                width: screenSize.width * 0.6,
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

  buildProductDetailPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(0),
      child: ListView(
        children: [
          Container(
            width: screenSize.width,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 245, 236)),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                child: Image.asset(
                  'assets/images/Deco1.png',
                  width: screenSize.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Quần chi chi đó',
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              '500000',
              style: TextStyle(color: Color.fromARGB(255, 244, 102, 4)),
            ),
          ),
          SizedBox(height: 10),
          builDescription(context),
        ],
      ),
    );
  }

  Widget builDescription(context) {
    return Html(
      data: 'Daddsa',
      style: {
        "body": Style(
            fontSize: FontSize(MediaQuery.of(context).size.width * 0.04),
            color: Colors.black,
            letterSpacing: 0.1,
            lineHeight: const LineHeight(1.5),
            textAlign: TextAlign.left)
      },
    );
  }
}
