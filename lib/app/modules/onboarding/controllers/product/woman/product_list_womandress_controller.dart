import 'dart:convert';
import 'package:clothes_app/app/core/remote_config.dart';
import 'package:get/get.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductListWomanDressController extends GetxController {
  static ProductListWomanDressController get to => Get.find();

  List productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductByColor();
  }

  Future<void> fetchProductByColor() async {
    http.Response response = await http
        .get(Uri.parse('${RemoteConfig.config['PRODUCT_WOMAN_DRESS']}'));

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(utf8.decode(response.bodyBytes));
      for (var item in list) {
        ProductModel productModel = ProductModel.fromJson(Map.from(item));
        productList.add(productModel);
      }

      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

  ProductModel getProductById(int productId) {
    return productList.firstWhere((product) => product.productId == productId);
  }
}
