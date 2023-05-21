import 'package:clothes_app/app/modules/home/bindings/home_binding.dart';
import 'package:clothes_app/app/modules/home/views/home_view.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/cart_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/login_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/mainhome_binding.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/views/cart_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/login_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/mainhome_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../onboarding/bindings/profile_binding.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final LoginController _loginController = Get.put(LoginController());

  var currentIndex = 0.obs;

  final pages = <String>['/mainhome', '/cart', '/profile'];

  void changePage(int index) {
    currentIndex.value = index;
    // Get.offNamedUntil(
    //   pages[index],
    //   (page) => page.settings.name == '/home',
    //   id: 1,
    // );
    update();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/mainhome' && currentIndex.value == 0) {
      return GetPageRoute(
        settings: settings,
        page: () => MainHomeView(),
        binding: MainHomeBinding(),
      );
    }

    if (settings.name == '/cart' && currentIndex.value == 1) {
      return GetPageRoute(
        settings: settings,
        page: () => CartView(),
        binding: CartBinding(),
      );
    }

    if (settings.name == '/profile' &&
        currentIndex.value == 2 &&
        _loginController.isAuthenticated == true) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfileView(),
        binding: ProfileBinding(),
      );
    } else if (settings.name == '/profile' &&
        currentIndex.value == 2 &&
        _loginController.isAuthenticated == false) {
      return GetPageRoute(
        settings: settings,
        page: () => LoginView(),
        binding: LoginBinding(),
      );
    }

    return null;
  }
}
