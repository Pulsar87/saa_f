import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/material-button-componat.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/JoinRequest/presentation/screen/rules-screen.dart';

import '../../../../core/components/snack_bar.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/router/router_name.dart';
import '../../../Home/presntation/layout/home_layout.dart';
import '../../domain/bloc/join_bloc.dart';
import '../widget/build-box-decoration-prev.dart';
import '../widget/build-box-decorationNext.dart';
import '../widget/first_screen.dart';
import '../widget/fourth-screen.dart';
import '../widget/second-screen.dart';
import '../widget/third-screen.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';
class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  int activeStep = 0; // Initial step set to 1.
  int upperBound = 4;
  bool showActiveStepWidget = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const FirstScreen(),
      const SecondScreen(),
      const ThirdScreen(),
      const FourthScreen()
    ];
    SizeConfig().init(context);
    JoinBloc bloc = context.read<JoinBloc>();

    return Scaffold(
      // drawer: MyDrawer(),

      appBar: AppBar(
        title: Text(StringConst.joinRequest),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconStepper(
                steppingEnabled: false,
                enableNextPreviousButtons: false,
                activeStepBorderPadding: 0,
                activeStepBorderColor: Colors.black,
                activeStepBorderWidth: 1,
                activeStepColor: Colors.grey[400],
                lineColor: primaryColor,
                stepColor: Colors.grey[300],
                icons: const [
                  Icon(Icons.person_rounded),
                  Icon(Icons.phone_rounded),
                  Icon(Icons.work),
                  Icon(Icons.account_balance_wallet_sharp),
                ],
                activeStep: activeStep,
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
              Visibility(
                visible: showActiveStepWidget,
                child: Column(
                  children: [
                    screens[activeStep],
                    activeStep == 0
                        ? Container(
                            padding: EdgeInsets.only(top: 30),
                            child: MaterialButtonComponent(
                              onPressed: () {
                                if (activeStep < upperBound &&
                                    activeStep == 0 &&
                                    bloc.firstKey.currentState!.validate() &&
                                    bloc.nameArabicController.text
                                        .isNotEmpty &&
                                    bloc.nameEnglishController.text
                                        .isNotEmpty &&
                                    bloc.fatherController.text.isNotEmpty &&
                                    bloc.birthdayController.text.isNotEmpty &&
                                    bloc.nationalityController.text
                                        .isNotEmpty) {
                                  setState(() {
                                    activeStep++;
                                    print(activeStep);
                                    print('first secenn  00000');
                                    showActiveStepWidget =
                                    true; // Show the active step widget
                                  });
                                }
                              },
                              child:  Text(
                                StringConst.next,
                                style:buttonTextStyle()
                              ),
                            )
                    )
                                  : activeStep == 1
                            ? Padding(
                                padding:
                                    EdgeInsets.only(top: 30),
                                child: joinRowButton(),
                              )
                            : activeStep == 2
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.height60!),
                                    child: joinRowButton(),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.height70!),
                                    child: joinRowButton(),
                                  )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row joinRowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        previousButton(),
        SizedBox(
          width: SizeConfig.width5,
        ),
        nextButton(),
      ],
    );
  }

  Widget nextButton() {
    JoinBloc bloc = context.read<JoinBloc>();
    return Expanded(
      child: MaterialButtonComponent(
        onPressed: () {
        if (activeStep < upperBound || activeStep == 3) {
          if (activeStep == 1 &&
              bloc.secondKey.currentState!.validate() &&
              bloc.phoneNumberController.text.isNotEmpty &&
              bloc.phoneWhatsappNumberController.text.isNotEmpty) {
            setState(() {
              activeStep++;
              print(activeStep);
              print('second secenn  11111111111');

              showActiveStepWidget = true; // Show the active step widget
            });
          } else if (activeStep == 2 &&
              bloc.thirdKey.currentState!.validate() &&
              bloc.academicSpecializationController.text.isNotEmpty &&
              bloc.workSpecializationController.text.isNotEmpty &&
              bloc.selectedLanguages.isNotEmpty) {
            setState(() {
              activeStep++;
              print(activeStep);
              print('third secenn  22222222222');
              showActiveStepWidget = true; // Show// the active step widget
            });
          } else if (activeStep == 2 &&
              bloc.languageKey.currentState!.validate() &&
              bloc.selectedLanguages.isEmpty) {
            showCustomSnackBar(
                context, AppConst.listLanguagesValidate, Colors.red);
          } else if (activeStep == 3 &&
              bloc.fourthKey.currentState!.validate() &&
              bloc.progressController.text.isNotEmpty &&
              bloc.interestsController.text.isNotEmpty &&
              bloc.selectedFavorite.isNotEmpty) {
            print(activeStep);
            print('four secenn  3333333333333333');
            Navigator.of(context).pushReplacement(MyAnimatedRoute(page: RulesScreen()));
            // context.goNamed(userInfoRouteName);
          } else if (activeStep == 3 &&
              bloc.favoriteKey.currentState!.validate() &&
              bloc.selectedFavorite.isEmpty) {
            showCustomSnackBar(
                context, AppConst.listFavoriteValidate, Colors.red);
          }
        }
      },
        child: const Text(StringConst.next),
      ),
    );


   //    SizedBox(
   //    width: SizeConfig.width3,
   //    child: Expanded(
   // MaterialButtonComponent(
   //      onPressed: () {
   //    if (activeStep > 0) {
   //      setState(() {
   //        activeStep--;
   //        showActiveStepWidget = true; // Show the active step widget
   //      });
   //    }
   //  },
   //  child: const Text('السابق'),
   //  ),
   //  );
   //
   //  );
  }

  Widget previousButton() {
    return Expanded(
      child: MaterialButtonComponent(
          onPressed: () {
            if (activeStep > 0) {
              setState(() {
                activeStep--;
                showActiveStepWidget = true; // Show the active step widget
              });
            }
          },
          child: const Text(StringConst.previous),
          ),
    );


    //   DecoratedBox(
    //   decoration: BoxDecoration(
    //     color: Colors.white70,
    //     borderRadius: BorderRadius.circular(SizeConfig.height5!),
    //     border: Border.all(
    //       color: Colors.grey,
    //     ),
    //   ),
    //   child: SizedBox(
    //     width: SizeConfig.width3,
    //     child: MaterialButton(
    //       onPressed: () {
    //         if (activeStep > 0) {
    //           setState(() {
    //             activeStep--;
    //             showActiveStepWidget = true; // Show the active step widget
    //           });
    //         }
    //       },
    //       child: const Text('السابق'),
    //     ),
    //   ),
    // );
  }
}
