import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/auth/presentation/screens/signup_verification_code.dart';
import '../../../../../core/responsive/responsive.dart';
import '../../../../core/components/app-text-field.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../core/components/text_form_field.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/constant/app_validate.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/repository/auth_repo.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../widgets/Login-forget-password-button.dart';
import '../widgets/Sign_up_top_pictures.dart';
import '../widgets/auth_clipbath.dart';
import '../widgets/error_cool_alert.dart';
import '../widgets/login-creat-account-row.dart';
import '../widgets/loginSuccessMethod.dart';
import '../widgets/sinup_body.dart';
import '../widgets/sinup_method.dart';
import '../widgets/validateEmail.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  final AuthBloc signupBloc = AuthBloc(authRepo: AuthRepo());
   var firstNameController = TextEditingController();
   var lastNameController = TextEditingController();
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var password2Controller = TextEditingController();
   var loginFormKey = GlobalKey<FormState>();
   bool isObscureText = true;
   bool isObscureText2 = true;


   @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => signupBloc,
        child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          if (state is SendEmailSuccessState){
            Navigator.of(context).pushReplacement(MyAnimatedRoute(page:
            SignupVerificationCodeScreen(
              name: "${firstNameController.text} ${lastNameController.text}",
              email: emailController.text,
              password: passwordController.text,
              passwordConfirmation: password2Controller.text,
            )
            ));

          }
          else if (state is SendEmailErrorState ) {
            sendEmailErrorCoolAlert(context, state);
          }
          else if(state is AuthErrorState) {
            authErrorCoolAlert(context);

          }

        }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return SafeArea(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: state is LoginLoadingState
                    ? MyLoadingScreen()
                    : SingleChildScrollView(
                  child: Form(
                    key: loginFormKey,
                    child: Container(
                      margin: const EdgeInsets.all(20),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // AuthClipPath(imagePath: AssetsConst.auth5),
                          SignUpTopPictures(),
                          AppTextField(
                            verticalPadding: 20,
                            controller: firstNameController,
                            validate: (value) {
                              if (value!.isEmpty)
                              { return StringConst.emptyValidate;}
                              return null; //
                            },
                            textInputType: TextInputType.text,
                            prefixIcon: Icon(Icons.person, color: darkGrey,),
                            labelText: StringConst.firstName,
                            hintText: StringConst.enterFirstName,
                          ),
                          AppTextField(
                            verticalPadding: 10,
                            controller: lastNameController,
                            validate: (value) {
                              if (value!.isEmpty)
                              { return StringConst.emptyValidate;}
                              return null;
                            },
                            textInputType: TextInputType.text,
                            prefixIcon: Icon(Icons.person, color: darkGrey,),
                            labelText: StringConst.lastName,
                            hintText: StringConst.enterLastName,
                          ),
                          AppTextField(
                            verticalPadding: 20,
                            controller: emailController,
                            validate: (value) {
                              if (value!.isEmpty)
                              { return StringConst.emptyValidate;}
                              else if (!validateEmail(value))
                              { return StringConst.emailValidate ;}
                              return null; // البريد الإلكتروني صالح
                            },
                            textInputType: TextInputType.emailAddress,
                            prefixIcon: Icon(Icons.email_outlined, color: darkGrey,),
                            hintText: StringConst.enterEmail,
                            labelText: StringConst.email,
                          ),
                          AppTextField(
                            verticalPadding: 10,
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            labelText: StringConst.password,
                            hintText: StringConst.enterPassword,
                            obscureText: isObscureText,
                            prefixIcon: Icon(Icons.lock, color: darkGrey),
                            suffixIcon: IconButton(
                              onPressed: () {
                                isObscureText = !isObscureText;
                                context.read<AuthBloc>().add(LoginChangeObscureTextEvent());
                              },
                              icon: isObscureText
                                  ?
                              Icon(Icons.visibility_off, color: darkGrey,)
                                  :
                              Icon(Icons.visibility, color: primaryColor,),
                            ),
                            validate: (value) {
                              if (value!.isEmpty)
                              { return StringConst.emptyValidate; }
                              if (value.length < 8)
                                return StringConst.shortPasswordValidate;
                            },
                          ),
                          AppTextField(
                            verticalPadding: 20,
                            controller: password2Controller,
                            textInputType: TextInputType.text,
                            labelText: StringConst.password,
                            hintText: StringConst.reEnterNewPassword,
                            obscureText: isObscureText2,
                            prefixIcon: Icon(Icons.lock, color: darkGrey),
                            suffixIcon: IconButton(
                              onPressed: () {
                                isObscureText2 = !isObscureText2;
                                context.read<AuthBloc>().add(LoginChangeObscureTextEvent());
                              },
                              icon: isObscureText2
                                  ?
                              Icon(Icons.visibility_off, color: darkGrey,)
                                  :
                              Icon(Icons.visibility, color: primaryColor,),
                            ),
                            validate: (value) {
                              if (value!.isEmpty)
                                return StringConst.emptyValidate;
                              else if (value.toString() != passwordController.text)
                                return StringConst.notSamePassword;
                              else
                                return null;
                            },
                          ),
                          MaterialButtonComponent(
                            verticalMargin: 20,
                            onPressed: () {
                              if (loginFormKey.currentState!.validate())
                              {
                                print("${firstNameController.text} ${lastNameController.text}");
                                context.read<AuthBloc>().add(
                                    SendVerificationMailEvent(email: emailController.text)
                              );
                              }
                            },
                            child: Text(
                                StringConst.singUp,
                                style:buttonTextStyle ()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        })));
  }

// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: buildFormSinupScreen(context),
  //   );
  // }
  //
  // Widget buildFormSinupScreen(BuildContext context) {
  //   AuthBloc authBloc = context.read<AuthBloc>();
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: SingleChildScrollView(
  //       child: SizedBox(
  //         height: displayHeight(context) / 1.2,
  //         child: Form(
  //           key: authBloc.formKey,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               const SizedBox(
  //                 height: 30,
  //               ),
  //               Text(
  //                 StringConst.singUp,
  //                 style: TextStyle(
  //                     fontSize: 40, color: Theme.of(context).primaryColor),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormFieldComponent(
  //                 labelText: StringConst.firstName,
  //                 controller: authBloc.firstNameController,
  //                 textInputType: TextInputType.name,
  //                 validate: MyValidate.firstNameValidate,
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormFieldComponent(
  //                   labelText: StringConst.lastName,
  //                   controller: authBloc.lastNameController,
  //                   textInputType: TextInputType.number,
  //                   validate: MyValidate.lastNameValidate),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormFieldComponent(
  //                   labelText: StringConst.email,
  //                   controller: authBloc.emailController,
  //                   textInputType: TextInputType.name,
  //                   validate: MyValidate.emailValidate),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormFieldComponent(
  //                   labelText: StringConst.password,
  //                   controller: authBloc.passwordController,
  //                   textInputType: TextInputType.number,
  //                   validate: MyValidate.passwordValidate),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextFormFieldComponent(
  //                   labelText: StringConst.confirmPassword,
  //                   controller: authBloc.confPasswordController,
  //                   textInputType: TextInputType.visiblePassword,
  //                   validate: MyValidate.passwordValidate),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               BlocBuilder<AuthBloc, AuthState>(
  //
  //                 builder: (context, state) {
  //                   if (state is AuthLoadingState) {
  //                     return Center(
  //                       child: CircularProgressIndicator(
  //                         color: Theme.of(context).primaryColor,
  //                       ),
  //                     );
  //                   } else {
  //                     return const SinupBody();
  //                   }
  //                 },
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

