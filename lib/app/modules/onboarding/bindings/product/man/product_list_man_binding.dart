import 'package:get/get.dart';

import '../../../controllers/product/man/product_list_man_controller.dart';

class ProductListManBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListManController>(
      () => ProductListManController(),
    );
  }
}
