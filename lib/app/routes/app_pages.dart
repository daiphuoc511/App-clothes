import 'package:clothes_app/app/modules/onboarding/bindings/cart_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/mainhome_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/order_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/man_jacket/product_list_manjacket_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/man_kaki/product_list_mankaki_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/man_polo/product_list_manpolo_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/man_shirt/product_list_manshirt_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/man_trouser/product_list_mantrouser_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/man_tshirt/product_list_mantshirt_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/man/product_list_man_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/woman/product_list_woman_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/woman/woman_dress/product_list_womandress_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/woman/woman_jacket/product_list_womanjacket_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/woman/woman_kaki/product_list_womankaki_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/product/woman/woman_tshirt/product_list_womantshirt_binding.dart';
import 'package:clothes_app/app/modules/onboarding/bindings/profile_binding.dart';
import 'package:clothes_app/app/modules/onboarding/views/cart_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/mainhome_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/order_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/man_jacket/product_list_manjacket_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/man_kaki/product_list_mankaki_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/man_polo/product_list_manpolo_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/man_shirt/product_list_manshirt_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/man_trouser/product_list_mantrouser_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/man_tshirt/product_list_mantshirt_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/man/product_list_man_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/woman/woman_dress/product_list_womandress_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/woman/woman_jacket/product_list_womanjacket_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/woman/woman_kaki/product_list_womankaki_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/woman/woman_skirt/product_list_womanskirt_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product/woman/woman_tshirt/product_list_womantshirt_view.dart';
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
      name: _Paths.PRODUCTMAN,
      page: () => ProductListManView(),
      binding: ProductListManBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTMANJACKET,
      page: () => ProductListManJacketView(),
      binding: ProductListManJacketBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTMANKAKI,
      page: () => ProductListManKakiView(),
      binding: ProductListManKakiBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTMANPOLO,
      page: () => ProductListManPoloView(),
      binding: ProductListManPoloBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTMANSHIRT,
      page: () => ProductListManShirtView(),
      binding: ProductListManShirtBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTMANTROUSER,
      page: () => ProductListManTrouserView(),
      binding: ProductListManTrouserBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTMANTSHIRT,
      page: () => ProductListManTshirtView(),
      binding: ProductListManTshirtBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTWOMAN,
      page: () => ProductListWomanView(),
      binding: ProductListWomanBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTWOMANDRESS,
      page: () => ProductListWomanDressView(),
      binding: ProductListWomanDressBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTWOMANJACKET,
      page: () => ProductListWomanJacketView(),
      binding: ProductListWomanJacketBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTWOMANKAKI,
      page: () => ProductListWomanKakiView(),
      binding: ProductListWomanKakiBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTWOMANSKIRT,
      page: () => ProductListWomanSkirtView(),
      binding: ProductListWomanTshirtBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTWOMANTSHIRT,
      page: () => ProductListWomanTshirtView(),
      binding: ProductListWomanTshirtBinding(),
    ),
  ];
}
