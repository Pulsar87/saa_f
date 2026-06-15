import 'package:flutter/material.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/router/animation_route.dart';
import '../screens/sinup.dart';

class LoginCreatAccountRow extends StatelessWidget {
  const LoginCreatAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MyAnimatedRoute(page: SignUpScreen(),));
          },
          child: Text(
            StringConst.creatAccount,
            style: TextStyle(
                color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
