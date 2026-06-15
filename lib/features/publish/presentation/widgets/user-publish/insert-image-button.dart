import 'package:flutter/material.dart';

import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';

class InsertImageButton extends StatelessWidget {
  const InsertImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      height: SizeConfig.screenHeight!/3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          color: primaryColor,
          width: 2,
        ),
        color: Colors.grey[400],
      ),
      child: IconButton(
        onPressed: () {
          print("Upload Photo");
        },
        icon: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo,color: Colors.black,),
            Icon(Icons.upload,color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
