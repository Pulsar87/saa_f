import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app-text-field.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/router/router_name.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/repository/auth_repo.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../widgets/auth_clipbath.dart';
import '../widgets/loginSuccessMethod.dart';
import '../widgets/reset-passowrd-method.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key, required this.code}) : super(key: key);
  var newPasswordController1 = TextEditingController();
  var newPasswordController2 = TextEditingController();
  final AuthBloc resetPasswordBloc = AuthBloc(authRepo: AuthRepo());
  var formKey = GlobalKey<FormState>();
  final String code;
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);


    return BlocProvider(
        create: (BuildContext context) => resetPasswordBloc,
        child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            resetPasswordSuccessMethod(state, context);
          }
          else if (state is ResetPasswordErrorState) {
            resetPasswordErrorCoolAlert(context, state);
          }
          else if(state is AuthErrorState) {
            authErrorCoolAlert(context);
          }

        }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white
                  // image: DecorationImage(
                  //     image: AssetImage(AssetsConst.authWallpaper),
                  //     fit: BoxFit.cover),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: state is ResetPasswordLoadingState ?
                  MyLoadingScreen()
                      :
                  SingleChildScrollView(
                    child:Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          AuthClipPath(imagePath: AssetsConst.auth4),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text (
                                    StringConst.setNewPassword,
                                    style: authTitleTextStyle()
                                ),
                                AppTextField(
                                    verticalPadding: SizeConfig.screenHeight!/20,
                                    controller: newPasswordController1,
                                    textInputType: TextInputType.text,
                                    validate: (value) {
                                      if (value!.isEmpty)
                                        return StringConst.emptyValidate;
                                      else if (value.length<8)
                                        return StringConst.password8letter;
                                      else
                                        return null;
                                    },
                                    hintText: StringConst.enterNewPassword,
                                    suffixIcon:Icon (Icons.password),
                                    helpText: StringConst.password8letter
                                ),
                                AppTextField(
                                  controller: newPasswordController2,
                                  textInputType: TextInputType.text,
                                  validate: (value) {
                                    if (value!.isEmpty)
                                      return StringConst.emptyValidate;
                                    else if (value.toString() != newPasswordController1.text)
                                      return StringConst.notSamePassword;
                                    else
                                      return null;
                                  },
                                  hintText:StringConst.reEnterNewPassword,
                                  suffixIcon:Icon (Icons.password),


                                ),
                                MaterialButtonComponent(
                                  verticalMargin :SizeConfig.screenHeight!/20,
                                  onPressed: (){
                                    if (formKey.currentState!.validate()) {
                                      context
                                          .read<AuthBloc>()
                                          .add(ResetPasswordEvent(
                                          newPasswordController1.text,
                                          code,
                                      ));


                                      print(newPasswordController1.text);
                                    }
                                  },

                                  child: Text(StringConst.resetPassword,
                                      style: buttonTextStyle()
                                  ),),
                                // TextButton(
                                //   child:  Text(
                                //     StringConst.resendTheCode,
                                //     style: TextStyle(
                                //       color: Theme.of(context).primaryColor,
                                //       fontSize: 18,
                                //     ),
                                //   ),
                                //   onPressed: () {
                                //     // context.pushReplacement(enterEmailScreenPath);
                                //
                                //   },
                                // )

                              ],
                            ),
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
}
