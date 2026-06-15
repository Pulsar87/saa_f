import 'package:flutter/material.dart';

class ShimmerContainer2 extends StatelessWidget {
  final Widget child;
  final Color color1;
  final Color color2;
  final double circular;
  const ShimmerContainer2({this.circular = 4, required this.child, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2,vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // color1:,color2: ,

          // colors: [ Colors.purple[700]!,  Colors.purple[700]!],
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(circular),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: child,
    );
  }
}
