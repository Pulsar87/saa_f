import 'package:flutter/material.dart';
import '../../../../../core/themes/text_style.dart';

class DrawerUserName extends StatelessWidget {
  const DrawerUserName({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Text(userName,style: normalTextStyle());
  }
}
