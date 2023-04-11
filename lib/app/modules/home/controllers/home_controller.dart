import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/browse', '/history', '/settings'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    // if (settings.name == '/browse')
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => CartPage(),
    //     binding: CartBinding(),
    //   );

    // if (settings.name == '/history')
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => ProfilePage(),
    //     binding: ProfileBinding(),
    //   );

    return null;
  }
}
