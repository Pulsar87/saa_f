import 'package:flutter/material.dart';
import 'package:saa_f/core/components/app_componant/image_componant.dart';
import '../../../../../../core/constant/assets-const.dart';
import '../../../../../../core/constant/colors/light-colors.dart';
import '../../../../../../core/constant/responsive/MediaQuery.dart';

class ImageInfoPublishPhoto extends StatelessWidget {
  const ImageInfoPublishPhoto({
    super.key, required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
    ImageComponant(imageUrl: img);
    //   Container(
    //   margin: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight!/40),
    //   decoration: BoxDecoration(
    //       color: Colors.grey[400],
    //       borderRadius: BorderRadius.all(Radius.circular(25)),
    //       border: Border.all(
    //         color: primaryColor,
    //         width: 2,
    //       ),
    //       image: DecorationImage(
    //           image: NetworkImage("${AppConst.imgUrl}$img"),
    //         // fit: BoxFit.fill
    //       )
    //   ),
    //   height: SizeConfig.screenHeight! / 3,
    // );
  }
}
