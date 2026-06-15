import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import '../../../../../core/router/animation_route.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../../auth/domain/bloc/auth_bloc.dart';
import '../../../../auth/presentation/screens/login.dart';
import '../../../bloc/drawer_bloc.dart';
import '../../../bloc/drawer_event.dart';

class DrawerListItem extends StatelessWidget {
   DrawerListItem({
    super.key,
    required this.text,
    required this.iconPath,
    required this.id,
  });
  final String text ;
  final IconData iconPath;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id == 10 )
        {
          print(" 'تسجيل الخروج'");
          context.read<AuthBloc>().add(LogoutEvent());
          Navigator.of(context).pushReplacement(MyAnimatedRoute(page: LoginScreen()));

        }
        else {
          context.read<DrawerBloc>().add(DrawerChangeDrawerBodyEvent(drawerId: id));
          Navigator.pop(context);
        }
      },


      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: id == HomeBloc.drawerId ? Colors.grey.withOpacity(0.2) : Colors.transparent ,

        ),
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(iconPath,color: primaryColor,size: 20),
            // id == 0 ?
            //     const Icon (Icons.home_filled,size: 30, color: ):
            // id == 10 ?
            // const Icon (Icons.logout_rounded,size: 30, color: ):
            //
            // // SvgPicture.asset(iconPath,height: 30,width: 30,),
            const SizedBox(width: 20,),
            Expanded(child: Text (text,style: normalTextStyle(fontSize: 17,color: primaryColor),)),
          ],
        ),
      ),
    );

  }
}
