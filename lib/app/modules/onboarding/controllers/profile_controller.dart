import 'dart:convert';
import 'dart:ffi';

import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/models/cart_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UpdateProfileResponse {
  int status;
  String msg;
  UpdateProfileResponse({required this.msg, required this.status});
}

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  final LoginController _loginController = Get.put(LoginController());
  late UserModel profile;
  late CartModel cartModel;
  RxString selectedGender = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAndParseProfile();
  }

  Future<dynamic> getProfile(String accessToken) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    http.Response response = await http
        .get(Uri.parse('http://192.168.1.1:8080/api/auth/profile_user'),
            headers: headers)
        .catchError(
      (error) {
        return Future.error(error);
      },
    );
    print('PROFILE RESPONE: ${utf8.decode(response.bodyBytes)}');
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<void> getAndParseProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString(LoginController.KEY_USER_TOKEN);

    if (accessToken != null && accessToken.isNotEmpty) {
      var dataResponse = await getProfile(accessToken).catchError((error) {
        return;
      });
      profile = UserModel.fromJson(dataResponse);
      if (profile.userId != null) {
        prefs.setInt(
            LoginController.KEY_PROFILE_ID.toString(), profile.userId!.toInt());
        cartModel = profile.cartModel!;
        if (profile.gender == 0) {
          selectedGender.value = 'female';
        } else if (profile.gender == 1) {
          selectedGender.value = 'male';
        } else if (profile.gender == 2) {
          selectedGender.value = 'other';
        }
      }
    }
  }

  Future<UpdateProfileResponse> updateProfile(String name, String birthday,
      int gender, String height, String weight) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(LoginController.KEY_USER_TOKEN);
    final int? profileID = prefs.getInt(LoginController.KEY_PROFILE_ID);

    final data = jsonEncode({
      "userDTO": {
        "name": "$name",
        "avatar": null,
        "birthday": "$birthday",
        "gender": gender,
        "height": height,
        "weight": weight
      }
    });
    print(data);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    http.Response response = await http.put(
        Uri.parse('http://192.168.1.1:8080/api/auth/edit_user/$profileID'),
        headers: headers,
        body: data);

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 200) {
        print("UPDATE PROFILE SUCCESS");
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    }
    return UpdateProfileResponse(
        msg: response.body, status: response.statusCode);
  }
}
