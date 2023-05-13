import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_womantshirt_controller.dart';
import 'package:get/get.dart';

class ProductListWomanTshirtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListWomanTshirtController>(
      () => ProductListWomanTshirtController(),
    );
  }
}
