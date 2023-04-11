import 'package:get_storage/get_storage.dart';

import '../../models/login_model.dart';
import '../../providers/login_provider.dart';
import '../interface/ilogin_adapter.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository({required this.provider});
  final ILoginProvider provider;

  final store = GetStorage();

  @override
  Future<LoginModel?> postLogin(String userName, String password) async {
    final loginData = await provider.postLogin(userName, password);
    print(loginData.status);
    if (loginData.status != 200) {
      return Future.error(loginData.toString());
    } else {
      return loginData;
    }
  }

  @override
  void saveLoginData(String userName, String? token, String? token_type,
      String? expires_in, bool isLogged) async {
    store.write('userName', userName);
    store.write('token', token);
    store.write('token_type', token_type);
    store.write('expires_in', expires_in);
    store.write('isLogged', isLogged);
  }

  @override
  void resetLoginData() {
    store.write('userName', '');
    store.write('token', '');
    store.write('token_type', '');
    store.write('expires_in', '');
    store.write('isLogged', false);
  }
}
