import 'package:flutter/material.dart';

import '../../../../../../core/constant/app-const.dart';
class ShowImagePublishRequestPhoto extends StatelessWidget {
  final String img;

  const ShowImagePublishRequestPhoto({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 5, 5),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage("${AppConst.imgUrl}$img"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
