import 'package:clothes_app/app/modules/onboarding/controllers/product/man/product_list_mantshirt_controller.dart';
import 'package:get/get.dart';

class ProductListManTshirtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListManTshirtController>(
      () => ProductListManTshirtController(),
    );
  }
}
