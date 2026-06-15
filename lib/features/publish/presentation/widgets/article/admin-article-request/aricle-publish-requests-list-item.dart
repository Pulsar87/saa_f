import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../../core/constant/app-const.dart';
import '../../../../../../core/constant/assets-const.dart';
import '../../../../../../core/constant/colors/light-colors.dart';
import '../../../../../../core/router/animation_route.dart';
import '../../../../domain/bloc/publish-bloc.dart';
import '../../../../domain/bloc/publish-event.dart';
import '../../../screens/admin-publish/article-info-publish.dart';
import '../../../screens/admin-publish/show-image-publish-requests.dart';

class ArticlePublishRequestListItem extends StatelessWidget {
  const ArticlePublishRequestListItem({
    super.key, required this.userName, required this.title, required this.time, required this.userImageUrl, required this.id,
  });
  final int id;
  final String userName;
  final String title;
  final String time;
  final  userImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration:  BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      //   border: Border.all(
      //     color: primaryColor!,
      //     width: 3,
      //   ),
      // ),

      child: Column(
        children: [
          Card(
            color: primaryColor.withOpacity(0.1),
            child: Container(
              child: ListTile(
                        leading: userImageUrl !=null? CircleAvatar(
                            backgroundImage: NetworkImage("${AppConst.imgUrl}$userImageUrl"),radius: 40,)
                        :
                        CircleAvatar(
                          backgroundImage: AssetImage(AssetsConst.profilePhoto),
                          radius: 40,
                ),

              onTap: (){
                  print(id);
                  Navigator.of(context).push(MyAnimatedRoute(page: ArticleInfoPublish(id: id, title: title)))
                      .then((value) =>
                  {
                    context.read<PublishBloc>().add(PublishRefreshEvent())
                  }
                  );
                },
                title: Text(title,style: normalTextStyle(),overflow: TextOverflow.ellipsis,maxLines: 1,),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("تم النشر من قبل: $userName",style: normalTextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                    Text(time,style: normalTextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                  ],
                ),
                isThreeLine: true,
                // leading: userImageUrl !=null? CircleAvatar(
                //   backgroundImage: NetworkImage("${AppConst.imgUrl}$userImageUrl"),radius: 40,)
                //     :
                // CircleAvatar(
                //   backgroundImage: AssetImage(AssetsConst.profilePhoto),
                //   radius: 40,
                // ),
                //
              ),

            ),
          ),
    //       ListTile(
    //         onTap: (){
    //           print(id);
    //           Navigator.of(context).push(MyAnimatedRoute(page: ArticleInfoPublish(id: id, title: title)));
    //           },
    //         title: Text(title,style: normalTextStyle(),overflow: TextOverflow.ellipsis,maxLines: 1,),
    //         subtitle: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(userName,style: normalTextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
    //             Text(time,style: normalTextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
    //           ],
    //         ),
    //         isThreeLine: true,
    //         leading: userImageUrl !=null? CircleAvatar(
    //             backgroundImage: NetworkImage("${AppConst.imgUrl}$userImageUrl"),radius: 40,)
    //         :
    //         CircleAvatar(
    //           backgroundImage: AssetImage(AssetsConst.profilePhoto),
    //           radius: 40,
    // ),
    //
    //       ),
        ],
      ),
    );
  }
}
