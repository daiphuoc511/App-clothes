import 'dart:ffi';

class CartModel {
  int? cartId;
  Float? totalCart;

  CartModel({this.cartId, this.totalCart});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    totalCart = json['totalCart'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cartId'] = cartId;
    data['totalCart'] = totalCart;
    return data;
  }
}
