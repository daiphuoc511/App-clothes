class SignupModel {
  String? name;
  String? email;
  String? password;
  String? birthday;
  int? gender;
  String? height;
  String? weight;

  SignupModel(
      {this.name,
      this.email,
      this.password,
      this.birthday,
      this.gender,
      this.height,
      this.weight});

  SignupModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    birthday = json['birthday'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['height'] = height;
    data['weight'] = weight;
    return data;
  }
}
