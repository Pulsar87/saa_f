import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/Home/presntation/layout/home_layout.dart';
import '../../../../core/components/material-button-componat.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/router/animation_route.dart';
import '../../domain/bloc/join_bloc.dart';
import '../join_method.dart';
import '../widget/join-text.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    JoinBloc bloc = context.read<JoinBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.joinRequest),
      ),
      body: BlocConsumer<JoinBloc, JoinState>(
        listener: (context, state) {
          if (state is JoinRequestSuccessState) {
            joinSuccessMethod(context,state);
            // CoolAlert.show(
            //         context: context,
            //         type: CoolAlertType.success,
            //         title: "تهانينا",
            //         text: 'تم انشاء طلب انتساب',
            //         autoCloseDuration: const Duration(seconds: 2),
            //         width: SizeConfig.width20)
            //     .then((value) =>Navigator.of(context).pushReplacement(MyAnimatedRoute(page: HomeScreen())));
          }
          if (state is JoinRequestErrorState) {
            joinErrorCoolAlert(context,state);
            // CoolAlert.show(
            //     context: context,
            //     type: CoolAlertType.error,
            //     title: "error..........",
            //     text: state.error,
            //     width: SizeConfig.width20);
          }
        },
        builder: (context, state) {
          if (state is JoinLoadingState) {
            return MyLoadingScreen();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: SizeConfig.height40!,
                children: [
                  Image.asset(AssetsConst.logo1),
                  const JoinText(isHeader: true, text: 'تأكيد الطلب'),
                  Text(StringConst.ruleLaw,style: normalTextStyle(),),
                  // const JoinText(text: AppConst.ruleLaw),
                  Column(
                    children: [
                      MaterialButtonComponent(
                        onPressed: () {
                          bloc.add(JoinRequestEvent());
                        },
                        child: Text(StringConst.agree,style: buttonTextStyle(),),
                      ),
                      MaterialButtonComponent(
                        // buttonColor: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MyAnimatedRoute(page: HomeLayout()));

                        },
                        child: Text(StringConst.dissAgree,style: buttonTextStyle(),),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
