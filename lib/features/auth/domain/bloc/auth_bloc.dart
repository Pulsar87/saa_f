import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/auth_repo.dart';
import '../models/login_model.dart';
import '../models/singup_successfully_model.dart';
import '../models/sinup_model.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitialState()) {
    on<SendVerificationMailEvent>(_sendCode);
    on<SignupEvent>(_sinup);
    on<LoginChangeObscureTextEvent>(_changeObsureText);
    on<LoginRequestEvent>(_sendLoginRequest);
    on<SendEmailToResetPasswordEvent>(_sendEmailToResetPasswordRequest);
    on<ResetPasswordEvent>(_resetPasswordRequest);
    on<CheckCodeEvent>(_checkCode);
  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  // String emailCode = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FutureOr<void> _sendCode(
      SendVerificationMailEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      var response = await authRepo.sendEmail(email: event.email);
      if (response == true) {
        emit(SendEmailSuccessState());
      } else {
        emit(SendEmailErrorState(error: response));
      }
    } catch (e) {
      print(e.toString());
      emit(SendEmailErrorState(error: e.toString()));
    }
  }

  FutureOr<void> _changeObsureText(
      LoginChangeObscureTextEvent event, Emitter<AuthState> emit) {
    print("LoginChangeObscureTextState");
    emit(LoginChangeObscureTextState());
  }

  FutureOr<void> _sinup(SignupEvent event, Emitter<AuthState> emit) async {
    emit(SinupLoadingState());
    try {
      var response = await authRepo.sinup(email: event.email,password: event.password,passwordConfirmation: event.passwordConfirmation,name: event.name,verificationCode: event.verificationCode);
      if (response is SignupModel) {
        emit(SinupSuccessState(sinupModel: response) );
        print("SinupSuccessState");
      } else {
        print("This is blooc SinupErrorState");
        print(response);

        emit(SinupErrorState(error: response));
      }
    } catch (e) {
      print(e.toString());
      emit(AuthErrorState());
    }
    // try {
    //   // // var response = await authRepo.sinup(sinupModel: event.sinupModel);
    //   // if (response is SinupSuccessfully) {
    //   //   emit(SinupSuccessState(sinupSuccessfully: response));
    //   // } else {
    //   //   emit(SinupErrorState(error: response.body.toString()));
    //   // }
    // } catch (e) {
    //   print(e.toString());
    //   emit(SinupErrorState(error: e.toString()));
    // }
  }

  Future<FutureOr<void>> _sendLoginRequest(
      LoginRequestEvent event, Emitter<AuthState> emit) async {
    print("start");
    emit(LoginLoadingState());

    try {
      var response = await authRepo.login(email: event.emailAddress, password: event.password);
      if (response is LoginModel) {
        emit(LoginSuccessState(loginModel: response));
        print("Login Success");
      } else {
        print("This is blooc");
        print(response);
        emit(LoginErrorState(error: response));
      }
    } catch (e) {
      print(e.toString());
      emit(AuthErrorState());
    }
  }

  Future<FutureOr<void>> _sendEmailToResetPasswordRequest(
      SendEmailToResetPasswordEvent event, Emitter<AuthState> emit) async {
    print("start");
    emit(SendEmailLoadingState());

    try {
      var response =
          await authRepo.sendEmailToResetPassword(email: event.emailAddress);
      if (response=="true") {
        emit(SendEmailSuccessState());
      } else {
        print("this is bloc $response");
        emit(SendEmailErrorState(error: response));
      }
    } catch (e) {
      print(e.toString());
      emit(AuthErrorState());
    }
  }

  Future<FutureOr<void>> _resetPasswordRequest(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    print("start");
    emit(ResetPasswordLoadingState());

    try {
      var response = await authRepo.resetPassword(
          password: event.password, code: event.code);
      if (response) {
        emit(ResetPasswordSuccessState());
      } else {
        emit(ResetPasswordErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(AuthErrorState());
    }
  }

  Future<FutureOr<void>> _checkCode(CheckCodeEvent event, Emitter<AuthState> emit) async {
    print ('check code');

    emit(CheckCodeLoadingState());

    try {
      var response = await authRepo.checkCode(code: event.code);
      if (response is bool && response) {
        emit(CheckCodeSuccessState());
      } else {
        emit(CheckCodeErrorState(error: response.toString()));
      }
    } catch (e) {
      print(e.toString());
      emit(AuthErrorState());
    }
  }
}
