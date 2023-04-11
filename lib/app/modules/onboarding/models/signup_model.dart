class SignupModel {
  int? status;
  String? message;
  SignupModel({this.status, this.message});

  SignupModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
