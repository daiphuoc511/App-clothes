import 'package:get/get_connect/connect.dart';
import 'package:global_configuration/global_configuration.dart';

import '../models/login_model.dart';

abstract class ILoginProvider {
  Future<LoginModel> postLogin(String userName, String password);
}

class LoginProvider extends GetConnect implements ILoginProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return LoginModel.fromJson(map);
      if (map is List)
        return map.map((item) => LoginModel.fromJson(item)).toList();
    };
    httpClient.timeout =
        Duration(seconds: GlobalConfiguration().getValue('timeout'));
    httpClient.baseUrl = GlobalConfiguration().getValue('apiUrl');
  }

  @override
  Future<LoginModel> postLogin(String userName, String password) async {
    final form = FormData({
      'token': GlobalConfiguration().getValue('token'),
      'username': userName,
      'password': password,
    });

    final response = await post('login', form);
    return response.body;
  }
}
