class TokenModel {
  String? token;
  String? type;

  TokenModel({this.token, this.type});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['type'] = type;
    return data;
  }
}
