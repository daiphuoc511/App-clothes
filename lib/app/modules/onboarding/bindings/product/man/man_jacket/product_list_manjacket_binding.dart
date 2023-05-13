import 'package:clothes_app/app/modules/onboarding/controllers/product/man/product_list_manjacket_controller.dart';
import 'package:get/get.dart';

class ProductListManJacketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListManJacketController>(
      () => ProductListManJacketController(),
    );
  }
}
