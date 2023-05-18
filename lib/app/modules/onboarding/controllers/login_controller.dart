import 'dart:convert';
import 'package:clothes_app/app/modules/onboarding/models/login_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/token_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class LoginResponse {
  int status;
  String msg;
  LoginResponse({required this.msg, required this.status});
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  late TokenModel token;
  late UserModel profile;
  static const String KEY_USER_EMAIL = 'userEmail';
  static const String KEY_USER_TOKEN = 'userToken';
  static const String KEY_PROFILE_ID = 'profileID';

  bool isAuthenticated = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  Future<LoginResponse> login(LoginModel loginModel) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    final data = jsonEncode(
        {"email": "${loginModel.email}", "password": "${loginModel.password}"});
    http.Response response = await http.post(
        Uri.parse('http://192.168.1.1:8080/api/auth/login'),
        headers: headers,
        body: data);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      token = TokenModel.fromJson(data);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(KEY_USER_EMAIL, loginModel.email.toString());
      sharedPreferences.setString(KEY_USER_TOKEN, token.token.toString());
      isAuthenticated = true;

      return LoginResponse(msg: "LOGIN SUCCESS", status: response.statusCode);
    }
    return LoginResponse(msg: response.body, status: response.statusCode);
  }

  Future<dynamic> getProfile(String accessToken) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    print('HEADERS $headers');
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
    final String? accessToken = prefs.getString(KEY_USER_TOKEN);

    if (accessToken != null && accessToken.isNotEmpty) {
      var dataResponse = await getProfile(accessToken).catchError((error) {
        return;
      });
      profile = UserModel.fromJson(dataResponse);
      if (profile.userId != null) {
        prefs.setInt(KEY_PROFILE_ID, profile.userId!.toInt());
      }
    }
  }

  void logout() {
    Get.toNamed(Routes.LOGIN);
  }
}
