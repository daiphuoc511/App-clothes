import '../../models/signup_model.dart';

abstract class ISignupRepository {
  Future<SignupModel?> postSignup(String first_name, String last_name,
      String phone, String email, String password, String term);
}
