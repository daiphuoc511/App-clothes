import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  var quantity = 0.obs;

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }
}
