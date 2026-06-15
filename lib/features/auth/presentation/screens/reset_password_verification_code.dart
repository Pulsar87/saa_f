import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/auth/presentation/screens/reset-password-screen.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/constant/app_media_query.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/router/animation_route.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../../domain/models/sinup_model.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_clipbath.dart';
import '../widgets/loginSuccessMethod.dart';
import '../widgets/send-email-method.dart';

class ResetPasswordVerificationCodeScreen extends StatelessWidget {
  ResetPasswordVerificationCodeScreen({Key? key}) : super(key: key);

   String emailCode = "";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AuthBloc bloc = context.read<AuthBloc>();
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is CheckCodeSuccessState) {
            Navigator.of(context).pushReplacement(MyAnimatedRoute(page: ResetPasswordScreen(code: emailCode,)));

            // checkCodeSuccessMethod(state,context);
          }
          else if (state is CheckCodeErrorState) {
            checkCodeErrorMethod(context,state);

          }
          else if(state is AuthErrorState) {
            authErrorCoolAlert(context);
          }
        },
        builder: (context, state) {
          if (state is CheckCodeLoadingState) {
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
                    AuthClipPath(imagePath: AssetsConst.auth6),
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
                                  StringConst.enterTheVerificationCodeMessageToResetPassword,
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
                            MaterialButtonComponent(
                              verticalMargin: SizeConfig.screenHeight!/15,
                              onPressed: () {
                                 context.read<AuthBloc>().add(
                                     CheckCodeEvent(emailCode)
                                );
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
