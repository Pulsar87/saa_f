// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:saa_project/features/publish/domain/bloc/teams-event.dart';
//
// import '../../../../../core/constant/responsive/MediaQuery.dart';
// import '../../../domain/bloc/teams-bloc.dart';
// import '../image-show-info/image-info-date-info.dart';
//
// class ImagePostLike extends StatelessWidget {
//    ImagePostLike({
//     super.key, required this.id,   this.isLike = false , required this.likesCount
//   });
//   final int id;
//    bool isLike ;
//   final int likesCount;
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text("$likesCount" ,style: Theme.of(context).textTheme.headlineMedium,),
//           IconButton(onPressed: (){
//             context
//                 .read<PublishBloc>()
//                 .add(ImageLikeEvent(imageID: id));
//           },
//               icon: Icon(
//                 isLike? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
//                 size: 30,),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';

class ImagePostLike extends StatelessWidget {
  ImagePostLike({
    super.key, required this.id,   this.isLike = false , required this.likesCount
  });
  final int id;
  bool isLike ;
  int likesCount;
  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {},

            child: BlocBuilder<PublishBloc, PublishState>(
                builder: (context, state) {
                  if(state is ImageLikeSuccessState) {
                    isLike = !isLike;
                    likesCount = isLike? ++likesCount : --likesCount;
                  }
                  if (state is PublishInitState) {
                    context
                        .read<PublishBloc>()
                        .add(ImageShowInfoGetInfoEvent(id: id));
                  }
                  if (state is ImageShowInfoSuccessState)
                  {
                    isLike = state.imageInfoModel.data!.isLike!;
                    likesCount = state.imageInfoModel.data!.likesCount!;
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("$likesCount" ,style: normalTextStyle(),),
                        IconButton(onPressed: (){
                          context
                              .read<PublishBloc>()
                              .add(ImageLikeEvent(imageID: id));
                        },
                          icon: Icon(
                            isLike? Icons.favorite : Icons.favorite_border,
                            size: 30,),
                        ),
                      ],
                    ),
                  );
                }
            )
        )
    );
  }
}





