import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ConectUsWhatsappButton extends StatelessWidget {
  const ConectUsWhatsappButton({
    super.key, required this.number,
  });
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      // margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          _launchWhatsApp(number: number);
        },
        child: Icon(
          FontAwesomeIcons.whatsapp,
          color: Colors.green[800],
          size: 35,
        ),
      ),
    );
  }
}

_launchWhatsApp({required String number }) async {

  String url = 'https://wa.me/$number'; // Replace with the desired phone number
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
