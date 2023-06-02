import 'package:clothes_app/app/modules/onboarding/controllers/cart_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/product/man/product_list_manpolo_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_cart_model.dart';
import 'package:clothes_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

class ProductDetailListManPoloView
    extends GetView<ProductListManPoloController> {
  final ProductListManPoloController _productListManPoloController =
      Get.put(ProductListManPoloController());
  final LoginController _loginController = Get.put(LoginController());
  final CartController _cartController = Get.put(CartController());
  ProductCartModel data = ProductCartModel();
  final int productId;
  final List<String> options = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  ProductDetailListManPoloView({required this.productId});

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
            onTap: () {
              _loginController.isAuthenticated.value
                  ? _showBottomSheet(context)
                  : showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.of(context).pop();
                        });
                        return AlertDialog(
                          backgroundColor: Colors.black54,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/icon_warning.png',
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Vui lòng đăng nhập để tiếp tục sử dụng chức năng này',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    );
            },
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
    var product = _productListManPoloController.getProductById(productId);
    data.productModel = product;

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
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                child: Image.asset(
                  product.image ?? 'assets/images/product/ao_a1.png',
                  width: screenSize.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              product.productName.toString(),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              product.price.toString(),
              style: const TextStyle(color: Color.fromARGB(255, 244, 102, 4)),
            ),
          ),
          const SizedBox(height: 10),
          builDescription(context),
        ],
      ),
    );
  }

  Widget builDescription(context) {
    return Html(
      data: 'Không có mô tả',
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

  void _showBottomSheet(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var product = _productListManPoloController.getProductById(productId);
    _cartController.quantity.value = 0;
    _cartController.sizeNumber.value = 6;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenSize.width / 3,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 245, 236)),
                        child: Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0)),
                            child: Image.asset(
                              product.image ??
                                  'assets/images/product/ao_a1.png',
                              width: screenSize.width / 3,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 244, 102, 4)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => _cartController.sizeNumber.value == 0
                                ? Text('Kho: ${product.s}')
                                : _cartController.sizeNumber.value == 1
                                    ? Text('Kho: ${product.m}')
                                    : _cartController.sizeNumber.value == 2
                                        ? Text('Kho: ${product.l}')
                                        : _cartController.sizeNumber.value == 3
                                            ? Text('Kho: ${product.xl}')
                                            : _cartController
                                                        .sizeNumber.value ==
                                                    4
                                                ? Text('Kho: ${product.xxl}')
                                                : _cartController
                                                            .sizeNumber.value ==
                                                        5
                                                    ? Text(
                                                        'Kho: ${product.xxxl}')
                                                    : const Text('Kho: 0'),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('SIZE'),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Obx(
                          () => GroupButton(
                            isRadio: true,
                            spacing: 10,
                            selectedButton: _cartController.hasSelection.value
                                ? _cartController.isSelectedSize.value
                                : 6,
                            onSelected: (index, isSelected) {
                              _cartController.setSelectedIndex(index);
                              _cartController.sizeNumber.value = index;
                            },
                            buttons: options,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Số lượng: '),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              _cartController.decreaseQuantity();
                            },
                          ),
                          Obx(() => Text('${_cartController.quantity.value}')),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              _cartController.increaseQuantity();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => _cartController.quantity.value == 0 ||
                            _cartController.sizeNumber.value == 6
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    fixedSize: Size(screenSize.width, 50),
                                    primary: Colors.grey),
                                child: const Text('Thêm vào giỏ hàng'),
                                onPressed: () {}),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  alignment: Alignment.center,
                                  fixedSize: Size(screenSize.width, 50),
                                  primary:
                                      const Color.fromARGB(255, 244, 101, 5),
                                ),
                                child: const Text('Thêm vào giỏ hàng'),
                                onPressed: () {
                                  addToCart(context);
                                }),
                          ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void addToCart(BuildContext context) async {
    var product = _productListManPoloController.getProductById(productId);
    data.productPrice =
        (_cartController.quantity.value * product.price!.toInt());
    AddToCartResponse addToCartResponse = await _cartController.addToCart(data);
    CartController.productCartModel1 = data;
    if (addToCartResponse.status == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/icon_success.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Thêm vào giỏ hàng thành công thành công',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      );
    }
    await _cartController.getCartByUser();
  }
}
