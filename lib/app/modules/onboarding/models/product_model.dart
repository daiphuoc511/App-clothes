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
  int? clothesType;
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
    productId = json['productId'];
    productName = json['productName'];
    image = json['image'];
    price = json['price'];
    brand = json['brand'];
    color = json['color'];
    s = json['s'];
    m = json['m'];
    l = json['l'];
    xl = json['xl'];
    xxl = json['xxl'];
    xxxl = json['xxxl'];
    clothesType = json['clothesType'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
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
