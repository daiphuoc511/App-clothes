import 'package:clothes_app/app/modules/onboarding/models/cart_model.dart';

class UserModel {
  int? userId;
  String? name;
  String? password;
  String? avatar;
  String? birthday;
  int? gender;
  String? fate;
  int? height;
  int? weight;
  String? email;
  CartModel? cartModel;

  UserModel(
      {this.userId,
      this.name,
      this.password,
      this.avatar,
      this.birthday,
      this.gender,
      this.fate,
      this.height,
      this.weight,
      this.email,
      this.cartModel});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int;
    name = json['name'] as String;
    password = json['password'] as String;
    avatar = json['avatar'] as String;
    birthday = json['birthday'] as String;
    gender = json['gender'] as int;
    fate = json['fate'] as String;
    height = json['height'] as int;
    weight = json['weight'] as int;
    email = json['email'] as String;
    cartModel = (json['cart'] == null
        ? null
        : CartModel.fromJson(json['cart'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['password'] = password;
    data['avatar'] = avatar;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['fate'] = fate;
    data['height'] = height;
    data['weight'] = weight;
    data['email'] = email;
    data['cart'] = cartModel?.toJson();
    return data;
  }
}
