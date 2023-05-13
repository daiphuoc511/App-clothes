import 'package:clothes_app/app/modules/onboarding/controllers/product/man/product_list_manshirt_controller.dart';
import 'package:get/get.dart';

class ProductListManShirtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListManShirtController>(
      () => ProductListManShirtController(),
    );
  }
}
