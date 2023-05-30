import 'dart:convert';

import 'package:clothes_app/app/modules/onboarding/controllers/cart_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductResponse {
  int status;
  String msg;
  ProductResponse({required this.msg, required this.status});
}

class ProductDetailController extends GetxController {
  static ProductDetailController get to => Get.find();
  final CartController _cartController = Get.put(CartController());
  static ProductModel productModel = ProductModel();
  int quantityS = 0;
  int quantityM = 0;
  int quantityL = 0;
  int quantityXL = 0;
  int quantityXXL = 0;
  int quantityXXXL = 0;

  Future<ProductResponse> updateProduct() async {
    int? s = productModel.s;
    int? m = productModel.m;
    int? l = productModel.l;
    int? xl = productModel.xl;
    int? xxl = productModel.xxl;
    int? xxxl = productModel.xxxl;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(LoginController.KEY_USER_TOKEN);

    if (_cartController.sizeNumber.value == 0) {
      quantityS = _cartController.quantity.value;
      s = productModel.s! - quantityS;
    } else if (_cartController.sizeNumber.value == 1) {
      quantityM = _cartController.quantity.value;
      m = productModel.m! - quantityM;
    } else if (_cartController.sizeNumber.value == 2) {
      quantityL = _cartController.quantity.value;
      l = productModel.l! - quantityL;
    } else if (_cartController.sizeNumber.value == 3) {
      quantityXL = _cartController.quantity.value;
      xl = productModel.xl! - quantityXL;
    } else if (_cartController.sizeNumber.value == 4) {
      quantityXXL = _cartController.quantity.value;
      xxl = productModel.xxl! - quantityXXL;
    } else if (_cartController.sizeNumber.value == 5) {
      quantityXXXL = _cartController.quantity.value;
      xl = productModel.xxxl! - quantityXXXL;
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final data = jsonEncode(
        {'s': s, 'm': m, 'l': l, 'xl': xl, 'xxl': xxl, 'xxxl': xxxl});

    http.Response response = await http.patch(
        Uri.parse(
            'http://192.168.1.1:8080/api/user/update_size_product/${LoginController.KEY_PRODUCT_ID}'),
        headers: headers,
        body: data);

    if (response.statusCode == 200) {
      print('UPDATE SUCCESS PRODUCT: ${response.body}');
      return ProductResponse(msg: response.body, status: response.statusCode);
    } else {
      return ProductResponse(msg: response.body, status: response.statusCode);
    }
  }
}
