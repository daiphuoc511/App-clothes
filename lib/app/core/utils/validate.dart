abstract class Validate {
  static const String PATTERN_EMAIL =
      "^([0-9a-zA-Z]([-.+\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})\$";
  static const String PATTERN_PW =
      "^[a-zA-Z!@#\$%^&*(){}_+-=/?,.:;<>~`'|\\[\\]\"\\\\]{6,}\$";
  static const String DEFAULT_MATCHES_PATTERN_EX = "Chuỗi không khớp với mẫu";
  static const String PATTERN_A = "Chuỗi không khớp với mẫu";
  static void matchesPattern(String input, RegExp pattern,
      [String message = DEFAULT_MATCHES_PATTERN_EX]) {
    if (pattern.hasMatch(input) == false) {
      throw ArgumentError(message);
    }
  }

  static void isEmail(String input,
      [String message = DEFAULT_MATCHES_PATTERN_EX]) {
    matchesPattern(input, RegExp(PATTERN_EMAIL), message);
  }

  static void isPassword(String input,
      [String message = DEFAULT_MATCHES_PATTERN_EX]) {
    matchesPattern(input, RegExp(PATTERN_PW), message);
  }
}
