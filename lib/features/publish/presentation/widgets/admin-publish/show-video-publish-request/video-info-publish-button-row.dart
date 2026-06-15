import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/components/material-button-componat.dart';
import '../../../../domain/bloc/publish-bloc.dart';
import '../../../../domain/bloc/publish-event.dart';

class VideoInfoPublishButtonRow extends StatelessWidget {
  const VideoInfoPublishButtonRow({
    super.key, required this.category,
    required this.description,
    required this.id,
  });
  final String category;
  final String description;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButtonComponent(
            onPressed: (){
              print("This is button");
              print("This is button");
              print("This is button");
              print(category);

              context
                  .read<PublishBloc>()
                  .add(VideoInfoPublishAcceptEvent(
                  id: id,category:category,description: description));
              context
                  .read<PublishBloc>()
                  .add(ShowVideoPublishRequestsEvent());

            },
            horizontalMargin: 10,
            child: Text("نشر",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                )
            ),
          ),
        ),
        Spacer(),
        Expanded(
          child: MaterialButtonComponent(
            onPressed: (){

              context
                  .read<PublishBloc>()
                  .add(VideoInfoPublishRefuseEvent(id));

            },
            horizontalMargin: 10,
            child: Text("حذف",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                )
            ),
          ),
        ),
      ],
    );
  }
}
