part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends  LoginState {}
class LoginSuccessState extends  LoginState {}
class LoginErrorState extends  LoginState {
  final String errorMessage ;

  LoginErrorState(this.errorMessage);
}