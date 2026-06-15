import 'package:flutter/material.dart';
import '../../../../../core/constant/app-const.dart';
import '../../../../../core/constant/assets-const.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/router/animation_route.dart';
import '../../../../../core/router/router_name.dart';
import '../../screens/image-show-info.dart';

class ImageGalleryItem extends StatelessWidget {
  const ImageGalleryItem({
    super.key, required this.title, required this.img, required this.id,
  });
  final String title;
  final String img;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth!/80,
        ),

        Expanded(child:
        InkWell(
          onTap: () {
            print(id);
            Navigator.of(context).push(MyAnimatedRoute(page: ImageShowInfo(id: id, title: title,)));


          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            color: Colors.transparent,
            height: SizeConfig.screenWidth!/2,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(

                  height: SizeConfig.screenWidth!/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),

                    image: DecorationImage(image: NetworkImage("${AppConst.imgUrl}$img"),fit: BoxFit.cover,
                    ),
                    color: Colors.grey,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 45,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
        )),
        SizedBox(
          width: SizeConfig.screenWidth!/80,
        ),
      ],
    );
  }
}
