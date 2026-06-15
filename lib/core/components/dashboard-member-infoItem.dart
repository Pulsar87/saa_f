import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/themes/dashboardTheme.dart';

class DashboardMemberInfoItem extends StatelessWidget {
  final double horizontalMargin;
  final double verticalMargin;
  final double horizontalPadding;
  final double verticalPadding;
  final double width;
  final double borderWidth;
  final Color color;
  final Color borderColor;
  final double borderRadius;
  final String dataType;
  final String info;
  const DashboardMemberInfoItem({
    super.key,
    this.horizontalMargin = 5 ,
    this.verticalMargin = 7,
    this.horizontalPadding = 16,
    this.verticalPadding = 10,
    this.width = double.infinity,
    this.borderWidth = 3,
    this.color = Colors.transparent,
    this.borderColor = Colors.black,
    this.borderRadius = 25,
    required this.dataType,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 5),
        //   decoration: BoxDecoration(
        //     // border: Border
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: primaryColor, width: 2)
        //   ),
        //   child: ListTile(
        //     title: Text(info,style: normalTextStyle(fontSize: 18) ,maxLines: 10,
        //       overflow: TextOverflow.ellipsis,),
        //     leading: Text(dataType,
        //       style: normalTextStyle() ,
        //       maxLines: 1, overflow: TextOverflow.ellipsis,),
        //      ),
        // ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin ,vertical: verticalMargin),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),

          // decoration: BoxDecoration(
          //   color: color,
          //   border: Border.all(color:Color(0xFF6A1B9A),width: borderWidth),
          //   borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(dataType,
                style: normalTextStyle() ,
                maxLines: 1, overflow: TextOverflow.ellipsis,),
              Expanded(
                child:
                Text(info,style: normalTextStyle(fontSize: 18) ,maxLines: 10,
                overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
