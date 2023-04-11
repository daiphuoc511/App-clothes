import 'package:get_storage/get_storage.dart';

import '../../models/signup_model.dart';
import '../../providers/signup_provider.dart';
import '../interface/isignup_adapter.dart';

class SignupRepository implements ISignupRepository {
  SignupRepository({required this.provider});
  final ISignupProvider provider;

  final store = GetStorage();

  @override
  Future<SignupModel?> postSignup(String first_name, String last_name,
      String phone, String email, String password, String term) async {
    final signupData = await provider.postSignup(
        first_name, last_name, phone, email, password, term);
    print(signupData.status);
    if (signupData.status != 200) {
      return Future.error(signupData.toString());
    } else {
      return signupData;
    }
  }
}
