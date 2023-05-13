import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_womandress_controller.dart';
import 'package:get/get.dart';

class ProductListWomanDressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListWomanDressController>(
      () => ProductListWomanDressController(),
    );
  }
}
