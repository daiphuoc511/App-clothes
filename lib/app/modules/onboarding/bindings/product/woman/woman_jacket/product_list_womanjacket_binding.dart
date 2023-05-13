import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_womanjacket_controller.dart';
import 'package:get/get.dart';

class ProductListWomanJacketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListWomanJacketController>(
      () => ProductListWomanJacketController(),
    );
  }
}
