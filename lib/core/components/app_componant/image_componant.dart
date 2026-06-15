import 'package:flutter/material.dart';

import '../../constant/app-const.dart';
import '../../themes/text_style.dart';

class ImageComponant extends StatelessWidget {
  const ImageComponant({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image(image: NetworkImage("${AppConst.imgUrl}${imageUrl}"),
          errorBuilder: (context, error, stackTrace) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Failed to load', style: normalTextStyle(),),
            );
          }
      ),
    );
  }
}
