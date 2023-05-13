import 'dart:convert';
import 'package:get/get.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductListManPoloController extends GetxController {
  static ProductListManPoloController get to => Get.find();

  List productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductByColor();
  }

  Future<void> fetchProductByColor() async {
    http.Response response = await http
        .get(Uri.parse('http://192.168.1.1:8080/api/user/product_man_polo'));

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
