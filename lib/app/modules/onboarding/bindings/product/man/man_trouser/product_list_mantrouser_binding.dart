import 'package:clothes_app/app/modules/onboarding/controllers/product/man/product_list_mantrouser_controller.dart';
import 'package:get/get.dart';

class ProductListManTrouserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListManTrouserController>(
      () => ProductListManTrouserController(),
    );
  }
}
