import 'package:clothes_app/app/modules/onboarding/controllers/mainhome_controller.dart';
import 'package:get/get.dart';

class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainHomeController>(
      () => MainHomeController(),
    );
  }
}
