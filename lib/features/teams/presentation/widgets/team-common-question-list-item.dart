import 'package:flutter/material.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../core/constant/colors/light-colors.dart';

class TeamCommonQuestionListItem extends StatelessWidget {
  const TeamCommonQuestionListItem({
    super.key, required this.question, required this.answer,
  });
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.all(20),
          width: double.infinity,
          child: Card(

            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(question,style: normalTextStyle(color: primaryColor,fontWeight: FontWeight.w900,fontSize: 25)),
                  Text(answer,style: normalTextStyle(color: Colors.black,fontWeight: FontWeight.w700),),

                ],
              ),
            ),
          ),
        ),
        // Text(question,style: TextStyle(color: primaryColor,fontWeight: FontWeight.w900,fontSize: 25)),
        // Text(answer,style: Theme.of(context).textTheme.labelMedium,),
      ],
    );
  }
}
