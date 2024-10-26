import 'package:bloc/bloc.dart';
import 'package:crud_graphql/core/user/user_manager.dart';
import 'package:meta/meta.dart';

import '../../../core/services/service_locator.dart';
import '../service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginService loginService = LoginService();

  login({required String userName, required String password}) async {
    print("login cubit");
    if (userName == '' || password == '') {
      return;
    }
    emit(LoginLoadingState());
    try {
      final result = await loginService.getLoginData(userName, password);
      sl<UserManager>().setLoginData(loginData: result.login);

      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
