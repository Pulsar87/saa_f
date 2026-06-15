part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class SinupSuccessState extends AuthState {
  final SignupModel sinupModel;

  SinupSuccessState({required this.sinupModel});


}

class SinupLoadingState extends AuthState {}

class SinupErrorState extends AuthState {
  final String error;
  SinupErrorState({required this.error});
}

class AuthLoadingState extends AuthState {}

class SendEmailSuccessState extends AuthState {
  SendEmailSuccessState();
}

class SendEmailErrorState extends AuthState {
  final String error;
  SendEmailErrorState({required this.error});
}

class LoginInitialState extends AuthState {}

class LoginChangeObscureTextState extends AuthState {}

class LoginSuccessState extends AuthState {
  final LoginModel loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;

  LoginErrorState({required this.error});
}

class AuthErrorState extends AuthState {
}

class SendEmailLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordErrorState extends AuthState {}


class CheckCodeSuccessState extends AuthState {}

class CheckCodeLoadingState extends AuthState {}

class CheckCodeErrorState extends AuthState {
  final String error;

  CheckCodeErrorState({required this.error});

}
