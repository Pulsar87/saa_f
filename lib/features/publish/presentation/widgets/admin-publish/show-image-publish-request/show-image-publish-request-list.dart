import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/publish/presentation/widgets/admin-publish/show-image-publish-request/show-image-request-item.dart';
import '../../../../../../core/router/animation_route.dart';
import '../../../../domain/bloc/publish-bloc.dart';
import '../../../../domain/bloc/publish-event.dart';
import '../../../screens/admin-publish/article-info-publish.dart';
import '../../../screens/admin-publish/image-info-publish.dart';
class ShowImagePublishRequestList extends StatelessWidget {
   ShowImagePublishRequestList({
    super.key, required this.imgList,
  });
 final  List <dynamic> imgList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          print(imgList[index]['id']);
          Navigator.of(context).push(MyAnimatedRoute(page: ImageInfoPublish(id: imgList[index]['id'], title: imgList[index]['title']??"title",)))
              .then((value) =>
          {
            context.read<PublishBloc>().add(PublishRefreshEvent())
          }
          );
          },
        child: ShowImageRequestItem(
          date: imgList[index]['created_at_relative'],
          img: imgList[index]['img_url'],
          title: imgList[index]['title']??"title",
          photographer: imgList[index]['photographer_name'],
        ),
      ),
      separatorBuilder: (context , index) =>
      const SizedBox(height: 15,),
      itemCount: imgList.length,
    );
  }
}
