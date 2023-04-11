import 'package:get/get_connect/connect.dart';
import 'package:global_configuration/global_configuration.dart';

import '../models/signup_model.dart';

abstract class ISignupProvider {
  Future<SignupModel> postSignup(String first_name, String last_name,
      String phone, String email, String password, String term);
}

class SignupProvider extends GetConnect implements ISignupProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SignupModel.fromJson(map);
      if (map is List)
        return map.map((item) => SignupModel.fromJson(item)).toList();
    };
    httpClient.timeout =
        Duration(seconds: GlobalConfiguration().getValue('timeout'));
    httpClient.baseUrl = GlobalConfiguration().getValue('apiUrl');
  }

  @override
  Future<SignupModel> postSignup(String first_name, String last_name,
      String phone, String email, String password, String term) async {
    final form = FormData({
      'token': GlobalConfiguration().getValue('token'),
      'firstname': first_name,
      'lastname': last_name,
      'phoneno': phone,
      'email': email,
      'pass': password,
      'term': term
    });

    final response = await post('register', form);
    //print(response.bodyString);
    return response.body;
  }
}
