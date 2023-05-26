import 'package:clothes_app/app/modules/onboarding/models/cart_model.dart';
import 'package:clothes_app/app/modules/onboarding/models/product_model.dart';

class ProductCartModel {
  int? productCartId;
  String? size;
  int? quantity;
  int? productPrice;
  CartModel? cartModel;
  ProductModel? productModel;

  ProductCartModel({
    this.productCartId,
    this.size,
    this.quantity,
    this.productPrice,
    this.cartModel,
    this.productModel,
  });

  ProductCartModel.fromJson(Map<String, dynamic> json) {
    productCartId = json['productCartId'] as int;
    size = json['size'] as String;
    quantity = json['quantity'] as int;
    productPrice = json['productPrice'] as int;
    cartModel = json['cartModel'] as CartModel;
    productModel = json['productModel'] as ProductModel;
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
