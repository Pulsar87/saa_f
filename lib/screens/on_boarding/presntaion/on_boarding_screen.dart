import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/assets-const.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/auth/presentation/screens/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/router/animation_route.dart';

final List<Map<String, dynamic>> pages = [
  {
    'icon': AssetsConst.onBoarding1,
    'text': "لنجتمع مع علم الفلك"
    // 'text': 'الجمعية الفلكية السورية، هي أول وأكبر تجمع لمحبي الفلك في سوريا \n شعارنا لنستعد أمجادنا في علم الفلك!',
  },
  {
    'icon': AssetsConst.onBoarding5,
    'text': 'ليالي رصد فلكية طويلة، \nتعرف معنا على خريطة السماء!',
  },
  {
    'icon': AssetsConst.onBoarding2,
    'text': 'تلسكوبات بأنواع مختلفة، يمكنك أن ترى النجوم والكواكب أقرب مما تظن!',
  },
];

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MyAnimatedRoute(page: LoginScreen()));

                      // Handle skip button press according to your requirements
                    },
                    child: Text('Skip'),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return buildPage(pages[index]);
                    },
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (currentPage > 0) {
                          controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                        }
                      },
                      child:
                      currentPage > 0 ?Icon(Icons.arrow_back_ios_new_rounded,size: 30,) : SizedBox()
                    ),
                    SizedBox(width: 20),
                    SmoothPageIndicator(
                      controller: controller,
                      count: pages.length,
                      effect: WormEffect(
                        dotColor: Colors.grey,activeDotColor: primaryColor
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        if (currentPage < pages.length - 1) {
                          controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                        } else {
                          Navigator.of(context).pushReplacement(MyAnimatedRoute(page: LoginScreen()));
                          // Handle last page button press according to your requirements
                        }
                      },
                      child:
                      currentPage < pages.length - 1 ?
                      Icon(Icons.arrow_forward_ios,size: 30)
                          :
                      Icon(Icons.login,size: 30,)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPage(Map<String, dynamic> pageData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Image(image: AssetImage(pageData['icon'],)),
        SizedBox(height: 20.0),
        Directionality(
          textDirection: TextDirection.ltr,

          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              pageData['text'],
              style: normalTextStyle(fontSize: 15),
              // textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

