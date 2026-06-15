import 'package:flutter/material.dart';
import 'package:saa_f/features/publish/presentation/widgets/admin-publish/show-image-publish-request/show-image-publish-request-photo.dart';
import '../../../../../../core/constant/colors/light-colors.dart';
import '../post-publish-request-info.dart';

class ShowImageRequestItem extends StatelessWidget {
   ShowImageRequestItem({
    super.key, required this.img, required this.title, required this.date, required this.photographer,
  });
   final String img;
   final String title;
   final String photographer;
   final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      // width: double.infinity,
      height: 180,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: primaryColor!,
          width: 3,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShowImagePublishRequestPhoto(img: img),
          PostPublishRequestInfo(title: title,date: date, photographer: photographer,),
        ],
      ),
    );
  }
}
