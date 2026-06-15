import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/colors/light-colors.dart';

class ArticlePostText extends StatefulWidget {
  const ArticlePostText({super.key, required this.articleText});
  final String articleText;

  @override
  State<ArticlePostText> createState() => _ArticlePostTextState();
}

class _ArticlePostTextState extends State<ArticlePostText> {
  bool showFullText = true;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.articleText.length >=150)
      showFullText = false;
  }

  @override
  Widget build(BuildContext context) {
    String displayText = showFullText ? widget.articleText : widget.articleText.substring(0, 50) + "...";

    return Column(
      children: [
        Text(
            displayText,
            style: normalTextStyle()),
        if (!showFullText)
          Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: () {

                  setState(() {
                    showFullText = true;
                  });
                },
                child: Text('مشاهدة المزيد',style: TextStyle(fontSize: 20, color: primaryColor),),
              ),
            ],
          ),

      ],
    );
  }
}
