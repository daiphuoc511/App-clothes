class Language {
  String? lang_code;
  String? country_code;
  String? name;
  String? flag;

  Language({this.lang_code, this.country_code, this.name, this.flag});

  Language.fromJson(Map<String, dynamic> json) {
    lang_code = json['key'];
    country_code = json['country_code'];
    name = json['name'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lang_code'] = lang_code;
    data['country_code'] = country_code;
    data['name'] = name;
    data['flag'] = flag;
    return data;
  }
}

List<Language> languages = [
  new Language(
      lang_code: 'en',
      country_code: 'US',
      name: 'English',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/640px-Flag_of_the_United_Kingdom.svg.png'),
  new Language(
      lang_code: 'vi',
      country_code: 'VN',
      name: 'Tiếng Việt',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/2560px-Flag_of_Vietnam.svg.png'),
];
