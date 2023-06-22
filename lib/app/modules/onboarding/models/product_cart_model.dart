import 'package:clothes_app/app/modules/onboarding/models/cart_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';
import 'package:get/get.dart';

class ProductCartModel {
  int? productCartId;
  String? size;
  int? quantity;
  int? productPrice;
  CartModel? cartModel;
  ProductModel? productModel;

  ProductCartModel(
      {this.productCartId,
      this.size,
      this.quantity,
      this.productPrice,
      this.cartModel,
      this.productModel});

  ProductCartModel.fromJson(Map<String, dynamic> json) {
    productCartId = json['productCartId'];
    size = json['size'];
    quantity = json['quantity'];
    productPrice = json['productPrice'];
    cartModel =
        (json['cart'] == null ? null : CartModel.fromJson(json['cart']));
    productModel = (json['product'] == null
        ? null
        : ProductModel.fromJson(json['product']));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productCartId'] = productCartId;
    data['size'] = size;
    data['quantity'] = quantity;
    data['productPrice'] = productPrice;
    data['cartModel'] = cartModel?.toJson();
    data['productModel'] = productModel?.toJson();
    return data;
  }
}
