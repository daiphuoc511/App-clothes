import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_woman_controller.dart';
import 'package:get/get.dart';

class ProductListWomanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListWomanController>(
      () => ProductListWomanController(),
    );
  }
}
