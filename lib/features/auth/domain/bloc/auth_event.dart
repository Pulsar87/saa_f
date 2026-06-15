part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class LogoutEvent extends AuthEvent {}


class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String verificationCode;
  SignupEvent({required this.name, required this.email, required this.password, required this.passwordConfirmation, required this.verificationCode});
}

class LoginRequestEvent extends AuthEvent {

  final String emailAddress;
  final String password;

  LoginRequestEvent(this.emailAddress, this.password);

}

class SendEmailToResetPasswordEvent extends AuthEvent {

   final String emailAddress;

  SendEmailToResetPasswordEvent(this.emailAddress);


}

class CheckCodeEvent extends AuthEvent {

  final String code;

  CheckCodeEvent(this.code);


}


class SendVerificationMailEvent extends AuthEvent {

   final String email;

   SendVerificationMailEvent({required this.email});


}

class LoginChangeObscureTextEvent extends AuthEvent{}

class ResetPasswordEvent extends AuthEvent {

  final String password;
  final String code;

  ResetPasswordEvent(this.password, this.code);



}
