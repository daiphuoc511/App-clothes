import '../../models/login_model.dart';

abstract class ILoginRepository {
  Future<LoginModel?> postLogin(String userName, String password);
  void saveLoginData(String userName, String? token, String? token_type,
      String? expires_in, bool isLogged);
  void resetLoginData();
}
