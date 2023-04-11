import 'package:get/get.dart';

import '../controllers/signup_controller.dart';
import '../providers/signup_provider.dart';
import '../repository/impl/signup_respository.dart';
import '../repository/interface/isignup_adapter.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
        () => SignupController(signupRepository: Get.find()));
    Get.lazyPut<ISignupProvider>(() => SignupProvider());
    Get.lazyPut<ISignupRepository>(
        () => SignupRepository(provider: Get.find()));
  }
}
