import 'package:clothes_app/app/modules/onboarding/controllers/product/woman/product_list_womankaki_controller.dart';
import 'package:get/get.dart';

class ProductListWomanKakiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListWomanKakiController>(
      () => ProductListWomanKakiController(),
    );
  }
}
