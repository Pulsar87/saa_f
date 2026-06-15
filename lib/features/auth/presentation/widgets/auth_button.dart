import 'package:flutter/material.dart';


class AuthButton extends StatefulWidget {
  final String text;

  final VoidCallback? push;
  final Color backcolor;
  final Color borderColor;

  const AuthButton(
      {Key? key,
        required this.text,
        this.push,
        required this.backcolor,
        required this.borderColor})
      : super(key: key);

  @override
  State<AuthButton> createState() => _ButtonMainState();
}

class _ButtonMainState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.push,
      child: Container(
        height: height * 0.07,
        width: width * 0.81,
        decoration: BoxDecoration(
          color: widget.backcolor,
          borderRadius: BorderRadius.circular(width * 0.08),
          border: Border.all(
              width: width * 0.001,
              color: widget.borderColor,
              style: BorderStyle.solid),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}