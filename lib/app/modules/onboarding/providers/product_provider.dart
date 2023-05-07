import 'package:http/http.dart' as http;
import 'package:get/get_connect/connect.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';
import 'package:global_configuration/global_configuration.dart';

abstract class IProductProvider {
  // Future<ProductModel> getAllProduct();
}

class ProductProvider extends GetConnect implements IProductProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ProductModel.fromJson(map);
      if (map is List) {
        return map.map((item) => ProductModel.fromJson(item)).toList();
      }
    };
    httpClient.timeout =
        Duration(seconds: GlobalConfiguration().getValue('timeout'));
    httpClient.baseUrl = GlobalConfiguration().getValue('apiUrl');
  }

  // @override
  // Future<ProductModel> getAllProduct() async {
  //   var response =
  //       await http.get(Uri.parse('http://localhost:8080/api/user/all_product'));
  //   return response.statusCode;
  // }
}
