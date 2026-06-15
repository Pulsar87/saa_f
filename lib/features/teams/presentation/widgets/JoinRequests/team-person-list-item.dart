import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/app-const.dart';
import '../../../../../core/constant/assets-const.dart';

class TeamPesonListItem extends StatelessWidget {
  const TeamPesonListItem({
    super.key,  this.listType, required this.name, required this.email, required this.phone, this.userImageUrl, this.onTap,
  });
  final  listType;
  final String name;
  final String email;
  final String phone;
  final userImageUrl;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child:
      ListTile(
        onTap:onTap,
        title: Text(name,style: normalTextStyle(),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text(email,style: normalTextStyle(fontSize: 15),),
            SizedBox(height: 5,),
            Text(phone,style: normalTextStyle(fontSize: 15),),
            // if(listType=="member")
            // Text("قائد الفريق"),
          ],
        ),
        isThreeLine: true,
        leading:
        userImageUrl !=null? CircleAvatar(
          backgroundImage: NetworkImage("${AppConst.imgUrl}$userImageUrl"),radius: 40,)
            :
        CircleAvatar(
          backgroundImage: AssetImage(AssetsConst.profilePhoto),
          radius: 40,
        ),

      ),

    );
  }
}
