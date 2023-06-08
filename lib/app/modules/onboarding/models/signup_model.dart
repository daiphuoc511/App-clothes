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
    name = json['name'] as String;
    email = json['email'] as String;
    password = json['password'] as String;
    birthday = json['birthday'] as String;
    gender = json['gender'] as int;
    height = json['height'] as String;
    weight = json['weight'] as String;
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
