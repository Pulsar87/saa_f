import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../../core/constant/assets-const.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/constant/strings-const.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../../core/components/app-text-field.dart';
import '../../data/repository/auth_repo.dart';
import '../../domain/bloc/auth_bloc.dart';
import '../widgets/Login-forget-password-button.dart';
import '../widgets/auth_clipbath.dart';
import '../widgets/login-creat-account-row.dart';
import '../widgets/loginSuccessMethod.dart';
import '../widgets/validateEmail.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final AuthBloc loginBloc = AuthBloc(authRepo: AuthRepo());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => loginBloc,
        child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          if (state is LoginSuccessState){loginSuccessMethod(state, context);}
          else if (state is LoginErrorState) {
            loginErrorCoolAlert(context, state);
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
                decoration: const BoxDecoration(color: Colors.white),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: state is LoginLoadingState
                      ? MyLoadingScreen()
                      : SingleChildScrollView(
                        child: Form(
                          key: loginFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AuthClipPath(imagePath: AssetsConst.auth2),
                              Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    AppTextField(
                                      verticalPadding: 40,
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
                                        { return StringConst.emptyPasswordValidate; }
                                        if (value.length < 8)
                                          return StringConst.shortPasswordValidate;
                                      },
                                    ),
                                    MaterialButtonComponent(
                                      verticalMargin: 20,
                                      onPressed: () {
                                        if (loginFormKey.currentState!.validate())
                                        { context.read<AuthBloc>().add(
                                            LoginRequestEvent( emailController.text, passwordController.text,)
                                        );
                                        }
                                      },
                                      child: Text(
                                          StringConst.login,
                                          style:buttonTextStyle ()),
                                    ),
                                    LoginForgetPasswordButton(),
                                    LoginCreatAccountRow()
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






// return Directionality(
//   textDirection: TextDirection.rtl,
//   child: Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//
//               Image(image: AssetImage(AssetsConst.logo1),),
//               Padding(
//                 padding: const EdgeInsets.symmetric( horizontal: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//
//                   children: [
//                     Text("تسجيل الدخول",style: onBoardSubTitleTextStyle(color: Colors.teal,fontSize: 40,),textAlign: TextAlign.start),
//
//                   ],
//                 ),
//               ),
//               // ClipPath(
//               //   clipper: WaveClipperTwo(),
//               //   child: Container(
//               //     height: SizeConfig.screenHeight!/3,
//               //     decoration: BoxDecoration(
//               //       color: Colors.black,
//               //     ),
//               //     child: Container(
//               //       width: double.infinity,
//               //       decoration: BoxDecoration(
//               //         gradient:  LinearGradient(
//               //           colors: [Colors.purple[800]!,Colors.teal,Colors.teal[300]!],
//               //           begin: Alignment.bottomLeft,
//               //           end: Alignment.topRight,
//               //         ),
//               //       ),
//               //       padding: EdgeInsets.all(16),
//               //       child: Center(
//               //
//               //         child: Text(
//               //           "الجمعية الفلكية السورية",
//               //           style: onBoardSubTitleTextStyle(color: Colors.white,fontSize: 40),
//               //
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               //
//               // ),
//               // Text(
//               //   "مرحباً بكَ في تطبيق الجمعية الفلكية السورية\n"
//               //       "تابع رحلتك في رحاب الكون",
//               //   textAlign: TextAlign.center,
//               //   style: onBoardSubTitleTextStyle(color: Colors.teal),
//               //
//               // ),
//               // SizedBox(height: 100,),
//               Padding(
//                 padding:  EdgeInsets.only(top:  SizeConfig.screenWidth!/ 20 , left:  SizeConfig.screenWidth! / 20, right:  SizeConfig.screenWidth! / 20),
//                 child: defaultFormField(
//                   type: TextInputType.text,
//                   label: 'Email',
//                   prefix: Icons.email_outlined,
//                   controller: emailController,
//
//                 ),
//               ),
//               Padding(
//                 padding:  EdgeInsets.only(top: SizeConfig.screenWidth! / 20 , left: SizeConfig.screenWidth! / 20 , right: SizeConfig.screenWidth! / 20),
//                 child: defaultFormField(
//                   type: TextInputType.text,
//                   label: 'Password',
//                   controller: passwordController,
//                   prefix: Icons.password_outlined,),
//               ),
//               Padding(
//                 padding:  EdgeInsets.all(SizeConfig.screenWidth! / 20),
//                 child: DefultButton(onPressed: (){}, child: Text('تسجيل الدخول',style: onBoardSubTitleTextStyle(color: Colors.white,fontSize: 20),),),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Dont have an acount ?',style: TextStyle(
//                       fontSize: 16
//                   ), ),
//                   TextButton(onPressed: (){},
//                       child: Text('Register Now',style: TextStyle(
//                           fontSize: 14
//                       ),))
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )),
// );
