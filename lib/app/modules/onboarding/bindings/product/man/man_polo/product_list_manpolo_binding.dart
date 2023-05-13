import 'package:clothes_app/app/modules/onboarding/controllers/product/man/product_list_manpolo_controller.dart';
import 'package:get/get.dart';

class ProductListManPoloBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListManPoloController>(
      () => ProductListManPoloController(),
    );
  }
}
