import 'package:flutter/material.dart';



class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey.withOpacity(0.3),
          strokeWidth: 3,
        ),
      ),
    );
  }
}

