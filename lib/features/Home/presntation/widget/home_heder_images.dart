import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constant/assets-const.dart';
import '../../../../core/constant/colors/light-colors.dart';

class HomeImages extends StatefulWidget {
  @override
  _HomeImagesState createState() => _HomeImagesState();
}
class _HomeImagesState extends State<HomeImages> {
  final List<String> imageUrls = [
    AssetsConst.home1,
    AssetsConst.home2,
    AssetsConst.home3,
    AssetsConst.home4,
    AssetsConst.home5,
    AssetsConst.home6,
    AssetsConst.home7,
    AssetsConst.home8,
    AssetsConst.home9,
    AssetsConst.home10,
  ];

  final PageController _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  late Timer _timer;
  final int _autoPlayDuration = 2000; // زمن تأخير التشغيل التلقائي

  @override
  void initState() {
    super.initState();
    _currentPageNotifier.addListener(_onPageChanged);
    _autoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    // تحديث _currentPageNotifier عند تغيير الصفحة
    _currentPageNotifier.value = _pageController.page!.round();
  }

  void _autoPlay() {
    _timer = Timer.periodic(Duration(milliseconds: _autoPlayDuration), (timer) {
      if (_pageController.page! < imageUrls.length - 1) {
        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 250,
        child: Stack(
          children: [
            PageView.builder(
              reverse: true,
              controller: _pageController,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[200],
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              onPageChanged: (int index) {
                _currentPageNotifier.value = index;
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: imageUrls.length,
                effect: WormEffect(
                  dotColor: primaryColor,
                  activeDotColor: Colors.white,
                  radius: 10,

                ), // You can customize the effect
              ),
            ),
          ],
        ),
      ),
    );
  }
}
