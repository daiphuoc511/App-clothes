class ProductModel {
  int? productId;
  String? productName;
  String? image;
  int? price;
  String? brand;
  String? color;
  int? s;
  int? m;
  int? l;
  int? xl;
  int? xxl;
  int? xxxl;
  bool? clothesType;
  String? description;

  ProductModel(
      {this.productId,
      this.productName,
      this.image,
      this.price,
      this.brand,
      this.color,
      this.s,
      this.m,
      this.l,
      this.xl,
      this.xxl,
      this.xxxl,
      this.clothesType,
      this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] as int;
    productName = json['product_name'] as String;
    image = json['image'] as String;
    price = json['price'] as int;
    brand = json['brand'] as String;
    color = json['color'] as String;
    s = json['s'] as int;
    m = json['m'] as int;
    l = json['l'] as int;
    xl = json['xl'] as int;
    xxl = json['xxl'] as int;
    xxxl = json['xxxl'] as int;
    clothesType = json['clothes_type'] as bool;
    description = json['description'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['image'] = image;
    data['price'] = price;
    data['brand'] = brand;
    data['color'] = color;
    data['s'] = s;
    data['m'] = m;
    data['l'] = l;
    data['xl'] = xl;
    data['xxl'] = xxl;
    data['xxxl'] = xxxl;
    data['clothes_type'] = clothesType;
    data['description'] = description;
    return data;
  }
}
