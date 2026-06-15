// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/components/app-text-field.dart';
// import '../../../../core/components/material-button-componat.dart';
// import '../../../../core/components/text_form_field.dart';
// import '../../../../core/constant/app_media_query.dart';
// import '../../../../core/constant/colors/light-colors.dart';
// import '../../../../core/router/router_name.dart';
// import '../../data/repository/auth_repo.dart';
// import '../../domain/bloc/auth_bloc.dart';
// import '../widgets/Login-forget-password-button.dart';
// import '../widgets/login-creat-account-row.dart';
// import '../widgets/loginSuccessMethod.dart';
// import '../widgets/validateEmail.dart';
//
// class DashboardLoginScreen extends StatelessWidget {
//   DashboardLoginScreen({Key? key}) : super(key: key);
//   final AuthBloc loginBloc = AuthBloc(authRepo: AuthRepo());
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var loginFormKey = GlobalKey<FormState>();
//   bool isObscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     // SizeConfig().init(context);
//     return BlocProvider(
//         create: (BuildContext context) => loginBloc,
//         child: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
//           if (state is LoginSuccessState) {
//             loginDashboardSuccessMethod(state, context);
//           } else if (state is LoginErrorState) {
//             loginErrorCoolAlert(context, state);
//           }
//         }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//           return SafeArea(
//             child: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(color: Colors.white
//                   // image: DecorationImage(
//                   //     image: AssetImage(AssetsConst.authWallpaper),
//                   //     fit: BoxFit.cover),
//                   ),
//               child: Scaffold(
//                 backgroundColor: Colors.transparent,
//                 body: Center(
//                   child: state is LoginLoadingState
//                       ? CircularProgressIndicator()
//                       : Container(
//                           height: 500,
//                           width: 500,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade200,
//                               borderRadius: BorderRadius.circular(25)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Center(
//                               child: SingleChildScrollView(
//                                 child: Form(
//                                   key: loginFormKey,
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         "Login",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleLarge,
//                                       ),
//                                       AuthTextField(
//                                         verticalPadding: 40,
//                                         controller: emailController,
//                                         validate: (value) {
//                                           if (value!.isEmpty) {
//                                             return "لا يمكن أن يظل هذا الحقل فارغاً";
//                                           } else if (!validateEmail(value)) {
//                                             return "يرجى إدخال عنوان بريد إلكتروني صالح";
//                                           }
//                                           return null; // البريد الإلكتروني صالح
//                                         },
//                                         textInputType:
//                                             TextInputType.emailAddress,
//                                         prefixIcon: Icon(
//                                           Icons.email,
//                                           color: darkGrey,
//                                         ),
//                                         hintText: "أدخل عنوان بريدك الإلكتروني",
//                                         labelText: "البريد الإلكتروني",
//                                       ),
//                                       AuthTextField(
//                                         controller: passwordController,
//                                         textInputType: TextInputType.text,
//                                         labelText: "كلمة السر",
//                                         hintText: "أدخل كلمة سر حسابك",
//                                         obscureText: isObscureText,
//                                         prefixIcon:
//                                             Icon(Icons.lock, color: darkGrey),
//                                         suffixIcon: IconButton(
//                                           onPressed: () {
//                                             isObscureText = !isObscureText;
//                                             context.read<AuthBloc>().add(
//                                                 LoginChangeObscureTextEvent());
//                                           },
//                                           icon: isObscureText
//                                               ? Icon(
//                                                   Icons.visibility_off,
//                                                   color: darkGrey,
//                                                 )
//                                               : Icon(
//                                                   Icons.visibility,
//                                                   color: primaryColor,
//                                                 ),
//                                         ),
//                                         validate: (value) {
//                                           if (value!.isEmpty) {
//                                             return "الرجاء إدخال كلمة السر";
//                                           }
//                                           if (value.length < 8)
//                                             return "يجب أن تحوي كلمة السر 8 محارف على الأقل";
//                                         },
//                                       ),
//                                       MaterialButtonComponent(
//                                         onPressed: () {
//                                           if (loginFormKey.currentState!
//                                               .validate()) {
//                                             context
//                                                 .read<AuthBloc>()
//                                                 .add(LoginRequestEvent(
//                                                   emailController.text,
//                                                   passwordController.text,
//                                                 ));
//                                           }
//                                         },
//                                         child: Text("Login",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold)),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                 ),
//               ),
//             ),
//           );
//         })));
//   }
// }
