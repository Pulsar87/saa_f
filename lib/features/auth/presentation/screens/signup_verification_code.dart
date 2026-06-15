import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/strings-const.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../../domain/models/sinup_model.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_clipbath.dart';
import '../widgets/loginSuccessMethod.dart';

class SignupVerificationCodeScreen extends StatelessWidget {
   SignupVerificationCodeScreen({Key? key, required this.passwordConfirmation, required this.name, required this.email, required this.password}) : super(key: key);

   String emailCode = "";
   final String passwordConfirmation;
   final String name;
   final String email;
   final String password;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AuthBloc bloc = context.read<AuthBloc>();
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SinupSuccessState) {
            print ("gggggggggggggggggggggggggg");
            signupSuccessMethod(state,context);
          }
          else if (state is SinupErrorState ) {
            signupErrorCoolAlert(context, state);
          }

          else if(state is AuthErrorState) {
            authErrorCoolAlert(context);
          }

          // if (state is SendEmailErrorState) {
          //   CoolAlert.show(
          //       context: context,
          //       type: CoolAlertType.error,
          //       title: "error..........",
          //       text: "cant send code to email pleas try again",
          //       width: width / 4);
          //   context.go(sinUpRoutePath);
          // }
          // if (state is SendEmailSuccessState) {
          //   CoolAlert.show(
          //       context: context,
          //       type: CoolAlertType.success,
          //       title: "success .......",
          //       text: "success send code to email",
          //       width: width / 4);
          // }
          // if (state is SinupSuccessState) {
          //   sinupSuccessMethod(state, context);
          //
          //   CoolAlert.show(
          //           context: context,
          //           type: CoolAlertType.success,
          //           title: "success .....",
          //           text: "success sinup",
          //           autoCloseDuration: const Duration(seconds: 2),
          //           width: width / 4)
          //       .then((value) => context.go(homeRoutePath));
          // }
        },
        builder: (context, state) {
          if (state is SinupLoadingState) {
            return MyLoadingScreen();
          } else {
            return SafeArea(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AuthClipPath(imagePath: AssetsConst.auth7),
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                                  StringConst.enterTheVerificationCodeMessage,
                                  textAlign: TextAlign.center,
                                  style: authTitleTextStyle(fontSize: 22),
                            ),
                            SizedBox(height: SizeConfig.screenHeight!/30,),
                            Text(
                                  StringConst.enterTheVerificationCodeMessageToSignup,
                                  textAlign: TextAlign.center,
                                  style: normalTextStyle(),
                            ),
                            SizedBox(height: SizeConfig.screenHeight!/15,),
                            PinCodeTextField(
                              // textStyle: TextStyle(color: Colors.white),
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.scale,
                              pinTheme: PinTheme(
                                selectedColor: primaryColor,
                                selectedFillColor:
                                Theme.of(context).secondaryHeaderColor,
                                activeFillColor: primaryColor,
                                activeColor: primaryColor,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(20),
                                fieldHeight: 40,
                                fieldWidth: 40,
                                inactiveFillColor: primaryColor,
                                inactiveColor: primaryColor,
                              ),
                              animationDuration: const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              onCompleted: (value) {
                                log("completed");
                                log(emailCode);
                                context.read<AuthBloc>().add(
                                    SignupEvent(email: email , verificationCode: emailCode, name: name,passwordConfirmation: passwordConfirmation,password: password  )
                                );

                                // bloc.add(SignupEvent(
                                //     sinupModel: SinupModel(
                                //         email: bloc.emailController.text,
                                //         name: bloc.firstNameController.text +
                                //             bloc.lastNameController.text,
                                //         password: bloc.passwordController.text,
                                //         passwordConfirmation:
                                //             bloc.confPasswordController.text,
                                //         verificationCode: bloc.emailCode)));
                              },
                              onChanged: (value) {
                                emailCode = value;
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                              appContext: context,
                            ),

                            // PinCodeTextField(
                            //   // textStyle: TextStyle(color: Colors.white),
                            //   length: 6,
                            //   obscureText: false,
                            //   animationType: AnimationType.scale,
                            //   pinTheme: PinTheme(
                            //     selectedColor: primaryColor,
                            //     selectedFillColor:
                            //     Theme.of(context).secondaryHeaderColor,
                            //     activeFillColor: primaryColor,
                            //     activeColor: primaryColor,
                            //     shape: PinCodeFieldShape.box,
                            //     borderRadius: BorderRadius.circular(20),
                            //     fieldHeight: 40,
                            //     fieldWidth: 40,
                            //     inactiveFillColor: primaryColor,
                            //     inactiveColor: primaryColor,
                            //   ),
                            //   animationDuration: const Duration(milliseconds: 300),
                            //   enableActiveFill: true,
                            //   onCompleted: (value) {
                            //     log("completed");
                            //     log(emailCode);
                            //     // bloc.add(SignupEvent(
                            //     //     sinupModel: SinupModel(
                            //     //         email: bloc.emailController.text,
                            //     //         name: bloc.firstNameController.text +
                            //     //             bloc.lastNameController.text,
                            //     //         password: bloc.passwordController.text,
                            //     //         passwordConfirmation:
                            //     //             bloc.confPasswordController.text,
                            //     //         verificationCode: bloc.emailCode)));
                            //   },
                            //   onChanged: (value) {
                            //     emailCode = value;
                            //   },
                            //   beforeTextPaste: (text) {
                            //     print("Allowing to paste $text");
                            //     //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //     //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            //     return true;
                            //   },
                            //   appContext: context,
                            // ),
                            MaterialButtonComponent(
                              verticalMargin: SizeConfig.screenHeight!/15,
                              onPressed: () {
                                //  context.read<AuthBloc>().add(
                                //     LoginRequestEvent( emailController.text, passwordController.text,)
                                // );
                              },
                              child: Text(
                                  StringConst.send,
                                  style:buttonTextStyle ()),
                            ),

                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
          );
          }
        },
      ),
    );
  }
}
