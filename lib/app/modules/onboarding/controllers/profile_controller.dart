import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  final LoginController _loginController = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    _loginController.getAndParseProfile();
  }
}
