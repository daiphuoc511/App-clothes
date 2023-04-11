class LoginModel {
  int? status;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  LoginModel({this.status, this.accessToken, this.tokenType, this.expiresIn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}
