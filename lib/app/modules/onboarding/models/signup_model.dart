class SignupModel {
  String? name;
  String? email;
  String? password;
  String? birthday;
  bool? gender;

  SignupModel(
      {this.name, this.email, this.password, this.birthday, this.gender});

  SignupModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    email = json['email'] as String;
    password = json['password'] as String;
    birthday = json['birthday'] as String;
    gender = json['gender'] as bool;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['birthday'] = birthday;
    data['gender'] = gender;
    return data;
  }
}
