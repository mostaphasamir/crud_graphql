import '../../feature/login/model/login_model.dart';

class UserManager {
  LoginData? loginData;

  setLoginData({required LoginData loginData}) {
    this.loginData = loginData;
  }
}
