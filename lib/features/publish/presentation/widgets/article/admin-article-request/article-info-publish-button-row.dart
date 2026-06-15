import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../../core/components/material-button-componat.dart';
import '../../../../domain/bloc/publish-bloc.dart';
import '../../../../domain/bloc/publish-event.dart';

class ArticleInfoPublishButtonRow extends StatelessWidget {
  const ArticleInfoPublishButtonRow({
    super.key, required this.category,
    required this.description,
    required this.id,
  });
  final String category;
  final  description;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButtonComponent(
            onPressed: (){
              print("This is button in article");
              print("This is button in article");
              print(category);

              context
                  .read<PublishBloc>()
                  .add(ArticleAcceptEvent(
                  id: id,category:category,
              )
              );
            },
            horizontalMargin: 10,
            child: Text("نشر",
                style: buttonTextStyle()
            ),
          ),
        ),
        Spacer(),
        Expanded(
          child: MaterialButtonComponent(
            onPressed: (){
              print("This is button in article");
              context
                  .read<PublishBloc>()
                  .add(ArticleRefuseEvent(id));
            },
            horizontalMargin: 10,
            child: Text("حذف",
                style: buttonTextStyle()
            ),
          ),
        ),
      ],
    );
  }
}
