
import 'package:flutter/material.dart';

import '../../../../../core/constant/colors/light-colors.dart';

class ImageInfoDescriptionInfo extends StatelessWidget {
  ImageInfoDescriptionInfo({
    super.key, required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.grey[400],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
          ),
          child: Text(description
          ,style: Theme.of(context).textTheme.titleMedium,)),
    );
  }
}
