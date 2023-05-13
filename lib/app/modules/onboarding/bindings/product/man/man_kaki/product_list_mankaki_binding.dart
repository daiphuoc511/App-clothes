import 'package:clothes_app/app/modules/onboarding/controllers/product/man/product_list_mankaki_controller.dart';
import 'package:get/get.dart';

class ProductListManKakiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListManKakiController>(
      () => ProductListManKakiController(),
    );
  }
}
