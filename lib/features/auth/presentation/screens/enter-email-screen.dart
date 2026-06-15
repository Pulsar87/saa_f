import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app-text-field.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/repository/auth_repo.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../widgets/auth_clipbath.dart';
import '../widgets/loginSuccessMethod.dart';
import '../widgets/send-email-method.dart';
import '../widgets/validateEmail.dart';

class EnterEmailScreen extends StatelessWidget {
   EnterEmailScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
   final AuthBloc emailBloc = AuthBloc(authRepo: AuthRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    return BlocProvider(
        create: (BuildContext context) => emailBloc,
        child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          if (state is SendEmailSuccessState) {
            sndEmailSuccessMethod(state, context);
          }
          else if (state is SendEmailErrorState) {
            sndEmailErrorCoolAlert(context, state);
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
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white
                  // image: DecorationImage(
                  //     image: AssetImage(AssetsConst.authWallpaper),
                  //     fit: BoxFit.cover),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: state is SendEmailLoadingState ?
                  MyLoadingScreen()
                      :
                  SingleChildScrollView(
                    child:Form(
                      key: formKey,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          AuthClipPath(imagePath: AssetsConst.auth1),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text (
                                  StringConst.resetPassword,
                                  style: authTitleTextStyle(),
                                ),
                                AppTextField(
                                    verticalPadding: SizeConfig.screenHeight!/20,
                                    controller: emailController,
                                    textInputType: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return StringConst.emptyValidate;
                                      } else if (!validateEmail(value)) {
                                        return StringConst.emailValidate;
                                      }
                                      return null; // البريد الإلكتروني صالح
                                    },
                                    hintText: StringConst.enterEmail,
                                    suffixIcon: Icon(Icons.email,color: darkGrey,),
                                    labelText:StringConst.email
                                ),
                                MaterialButtonComponent(
                                  verticalMargin: 0,
                                  onPressed: (){
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(SendEmailToResetPasswordEvent(emailController.text,));
                                    }
                                    print(emailController.text);
                                  },
                                  child: Text(StringConst.sendCode,
                                      style: buttonTextStyle()
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Text (
                                  StringConst.sendCodeText,
                                  style: normalTextStyle(),
                                ),

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
