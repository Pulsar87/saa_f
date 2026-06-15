import 'package:flutter/material.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/router/animation_route.dart';
import '../screens/enter-email-screen.dart';

class LoginForgetPasswordButton extends StatelessWidget {
  const LoginForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(MyAnimatedRoute(page: EnterEmailScreen(),));
        },
        child: Text(
          StringConst.forgetPassword,
          style:
          TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ));
  }
}
