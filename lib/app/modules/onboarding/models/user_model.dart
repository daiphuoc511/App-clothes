import 'package:clothes_app/app/modules/onboarding/models/cart_model.dart';

class UserModel {
  int? userId;
  String? name;
  String? password;
  String? avatar;
  String? birthday;
  int? gender;
  String? fate;
  String? height;
  String? weight;
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
    userId = json['userId'];
    name = json['name'];
    password = json['password'];
    avatar = json['avatar'];
    birthday = json['birthday'];
    gender = json['gender'];
    fate = json['fate'];
    height = json['height'];
    weight = json['weight'];
    email = json['email'];
    cartModel =
        (json['cart'] == null ? null : CartModel.fromJson(json['cart']));
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
