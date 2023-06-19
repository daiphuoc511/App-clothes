import 'dart:convert';

import 'package:clothes_app/app/modules/onboarding/controllers/cart_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductResponse {
  int status;
  String msg;
  ProductResponse({required this.msg, required this.status});
}

class ProductDetailController extends GetxController {
  static ProductDetailController get to => Get.find();
}
