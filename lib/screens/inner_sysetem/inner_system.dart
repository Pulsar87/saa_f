import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../core/constant/assets-const.dart';
import '../../core/constant/colors/light-colors.dart';
class InnerSystem extends StatelessWidget {
  const InnerSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("النظام الداخلي",style: TextStyle(color: primaryColor),),
        // elevation: 5,
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: primaryColor,)),
        ),
        body: Container(
          decoration: BoxDecoration(
            // color: Colors.purple
            gradient: LinearGradient(
            colors: [primaryColor,PlightgreenColor], // الألوان التي تريدها في التدرج
            begin: Alignment.topLeft, // بداية التدرج من الزاوية العليا اليسرى
            end: Alignment.bottomRight, // نهاية التدرج في الزاوية السفلية اليمنى
          ),

        ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(child: Image(image: AssetImage(AssetsConst.logo1))),
                    Text("النظام الداخلي في الجمعية الفلكية السورية\n",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: primaryColor
                    ),),
                    Text(
"___________________________________________"
    "___________________________________________________"
    "____________________________________________________________"
    "____________________________________________________________________"
    "____________________________________________________"
    "_________________________________________________"
    "________________________________________________________"
    "________________________________________________________"
    "________________________________________________________"
    "______________________________________________________",
                      style: normalTextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
