import 'package:clothes_app/app/modules/home/bindings/home_binding.dart';
import 'package:clothes_app/app/modules/home/views/home_view.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/cart_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/mainhome_binding.dart';
import 'package:clothes_app/app/modules/onboarding/views/cart_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/mainhome_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../onboarding/bindings/profile_binding.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/mainhome', '/cart', '/profile'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.offAndToNamed(pages[index], id: 1);
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

    if (settings.name == '/profile' && currentIndex.value == 2) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfileView(),
        binding: ProfileBinding(),
      );
    }

    return null;
  }
}
