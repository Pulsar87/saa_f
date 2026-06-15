import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';

class VideoPostLike extends StatelessWidget {
  VideoPostLike({
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
                  if(state is VideoLikeSuccessState) {
                    isLike = !isLike;
                    likesCount = isLike? ++likesCount : --likesCount;
                  }
                  if (state is PublishInitState) {
                    context
                        .read<PublishBloc>()
                        .add(VideoShowInfoGetInfoEvent(id: id));
                  }
                  if (state is VideoShowInfoSuccessState)
                    {
                      isLike = state.videoInfoModel.data!.isLike!;
                      likesCount = state.videoInfoModel.data!.likesCount!;
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
                              .add(VideoLikeEvent(videoID: id));
                        },
                          icon: Icon(
                            isLike? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
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





