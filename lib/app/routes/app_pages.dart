import 'package:clothes_app/app/modules/onboarding/bindings/cart_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/mainhome_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/order_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/product_list_man_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/woman/product_list_woman_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product_detail_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/profile_binding.dart';
import 'package:clothes_app/app/modules/onboarding/views/cart_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/mainhome_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/order_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/product_list_man_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product_detail_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/profile_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/login_binding.dart';
import '../modules/onboarding/bindings/signup_binding.dart';
import '../modules/onboarding/bindings/splash_screen_binding.dart';
import '../modules/onboarding/views/login_view.dart';
import '../modules/onboarding/views/product/woman/product_list_woman_view.dart';
import '../modules/onboarding/views/signup_view.dart';
import '../modules/onboarding/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAINHOME,
      page: () => MainHomeView(),
      binding: MainHomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAIL,
      page: () => ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTMAN,
      page: () => ProductListManView(),
      binding: ProductListManBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTWOMAN,
      page: () => ProductListWomanView(),
      binding: ProductListWomanBinding(),
    ),
  ];
}
