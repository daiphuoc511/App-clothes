import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/views/cart_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/login_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/mainhome_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (_homeController.currentIndex.value) {
          case 0:
            return MainHomeView();
          case 1:
            return CartView();
          case 2:
            if (_loginController.isAuthenticated == false) {
              return LoginView();
            } else {
              return ProfileView();
            }
          default:
            return Container();
        }
      }),
      // Navigator(
      //   key: Get.nestedKey(1),
      //   initialRoute: Routes.MAINHOME,
      //   onGenerateRoute: controller.onGenerateRoute,
      // ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Giỏ hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: _homeController.currentIndex.value,
          selectedItemColor: Colors.blue,
          onTap: _homeController.changePage,
        ),
      ),
    );
  }
}
