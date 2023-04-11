import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../providers/login_provider.dart';
import '../repository/impl/login_repository.dart';
import '../repository/interface/ilogin_adapter.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginProvider>(() => LoginProvider());
    Get.lazyPut<ILoginRepository>(() => LoginRepository(provider: Get.find()));
    // Get.lazyPut<LoginController>(
    //     () => LoginController(loginRepository: Get.find()));
  }
}
