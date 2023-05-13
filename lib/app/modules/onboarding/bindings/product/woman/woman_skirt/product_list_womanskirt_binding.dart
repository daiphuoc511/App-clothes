import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_womanskirt_controller.dart';
import 'package:get/get.dart';

class ProductListWomanSkirtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListWomanSkirtController>(
      () => ProductListWomanSkirtController(),
    );
  }
}
