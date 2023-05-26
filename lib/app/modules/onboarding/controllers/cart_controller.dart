import 'dart:convert';

import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddToCartResponse {
  int status;
  String msg;
  AddToCartResponse({required this.msg, required this.status});
}

class CartController extends GetxController {
  static CartController get to => Get.find();

  var quantity = 0.obs;
  RxInt isSelectedSize = RxInt(-1);

  void setSelectedIndex(int index) {
    isSelectedSize.value = index;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  Future<AddToCartResponse> addToCart(ProductCartModel productCartModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(LoginController.KEY_USER_TOKEN);

    final data = jsonEncode({
      "size": "${productCartModel.size}",
      "quantity": {productCartModel.quantity},
      "productPrice": {productCartModel.productPrice},
      "cart": "${productCartModel.cartModel}",
      "product": "${productCartModel.productModel}",
    });
    print(data);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    http.Response response = await http.post(
        Uri.parse('http://192.168.1.1:8080/api/user/add_to_cart'),
        headers: headers,
        body: data);

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 200) {
        print("ADD PRODUCT TO CARTT SUCCESS");
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    }
    return AddToCartResponse(msg: response.body, status: response.statusCode);
  }
}
