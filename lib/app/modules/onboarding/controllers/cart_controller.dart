import 'dart:convert';

import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/product_detail_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/profile_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_cart_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddToCartResponse {
  int status;
  String msg;
  AddToCartResponse({required this.msg, required this.status});
}

class CartResponse {
  int status;
  String msg;
  CartResponse({required this.msg, required this.status});
}

class CartController extends GetxController {
  static CartController get to => Get.find();
  final ProfileController _profileController = Get.put(ProfileController());
  List productCartList = <ProductCartModel>[].obs;

  static ProductCartModel productCartModel1 = ProductCartModel();
  var quantity = 0.obs;
  var sizeNumber = 6.obs;
  String sizeProduct = '';
  RxInt isSelectedSize = RxInt(-1);
  RxBool hasSelection = false.obs;

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

  Future<void> getCartByUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(LoginController.KEY_USER_TOKEN);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    http.Response response = await http.get(
        Uri.parse('http://192.168.1.1:8080/api/user/get_cart'),
        headers: headers);

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
        for (var item in list) {
          ProductCartModel productCartModel =
              ProductCartModel.fromJson(Map.from(item));
          productCartList.add(productCartModel);
        }
        update();
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    }
  }

  Future<AddToCartResponse> addToCart(ProductCartModel productCartModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(LoginController.KEY_USER_TOKEN);

    if (sizeNumber.value == 0) {
      sizeProduct = 'S';
    } else if (sizeNumber.value == 1) {
      sizeProduct = 'M';
    } else if (sizeNumber.value == 2) {
      sizeProduct = 'L';
    } else if (sizeNumber.value == 3) {
      sizeProduct = 'XL';
    } else if (sizeNumber.value == 4) {
      sizeProduct = 'XXL';
    } else if (sizeNumber.value == 5) {
      sizeProduct = 'XXXL';
    }

    final data = jsonEncode({
      "size": sizeProduct,
      "quantity": quantity.toInt(),
      "productPrice": productCartModel.productPrice,
      "cart": {
        "cartId": _profileController.profile.cartModel?.cartId,
      },
      "product": {
        "productId": productCartModel.productModel?.productId,
      }
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
        print("ADD PRODUCT TO CART SUCCESS");
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    }
    return AddToCartResponse(msg: response.body, status: response.statusCode);
  }

  // Future<CartResponse> updateCart(Float totalCart) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? token = prefs.getString(LoginController.KEY_USER_TOKEN);

  //   final data = jsonEncode({

  //   });
  //   print(data);

  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   http.Response response = await http.patch(
  //       Uri.parse('http://192.168.1.1:8080/api/user/update_cart/${}'),
  //       headers: headers,
  //       body: data);

  //   if (token != null && token.isNotEmpty) {
  //     if (response.statusCode == 200) {
  //       print("ADD PRODUCT TO CARTT SUCCESS");
  //     } else {
  //       Get.snackbar('Error Loading data!',
  //           'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
  //     }
  //   }
  //   return CartResponse(msg: response.body, status: response.statusCode);
  // }
}
