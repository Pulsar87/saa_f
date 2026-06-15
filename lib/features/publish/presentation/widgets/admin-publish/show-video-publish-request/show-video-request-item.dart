import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/publish/presentation/widgets/admin-publish/show-video-publish-request/show-video-publish-request-photo.dart';
import '../../../../../../core/constant/colors/light-colors.dart';
import '../../../../../../core/router/animation_route.dart';
import '../../../../domain/bloc/publish-bloc.dart';
import '../../../../domain/bloc/publish-event.dart';
import '../../../screens/admin-publish/video-info-publish.dart';
import '../post-publish-request-info.dart';

class ShowVideoRequestItem extends StatelessWidget {
  const ShowVideoRequestItem({
    super.key, required this.title, required this.date, required this.id, required this.videoUrl, required this.photographer,
  });
  final String title;
  final String date;
  final String photographer;
  final int id;
  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("id is $id");
        Navigator.of(context).push(MyAnimatedRoute(page: VideoInfoPublish(id: id, title: title)))
            .then((value) =>
        {
          context.read<PublishBloc>().add(PublishRefreshEvent())
        }
        );

        },
      child:  Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        // width: double.infinity,
        height: 180,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: primaryColor!,
            width: 3,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShowVideoPublishRequestPhoto(videoUrl: videoUrl,),
            PostPublishRequestInfo(title: title,date: date,photographer: photographer,),
          ],
        ),
      ),
    );
  }
}
