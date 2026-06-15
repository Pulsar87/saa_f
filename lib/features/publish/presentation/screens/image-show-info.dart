import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/app_componant/image_componant.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/constant/app-const.dart';
import '../../../../core/constant/responsive/MediaQuery.dart';
import '../../data/repository/publish_repo.dart';
import '../../domain/bloc/publish-bloc.dart';
import '../../domain/bloc/publish-event.dart';
import '../../domain/bloc/publish-state.dart';
import '../widgets/post/image-post-description.dart';
import '../widgets/post/image-post-like.dart';
import '../widgets/post/post-time.dart';
import '../widgets/post/post-user-info.dart';

class ImageShowInfo extends StatelessWidget {
  ImageShowInfo({super.key, required this.id, required this.title});

  final int id;
  final String title;
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
                  if (state is PublishInitState) {
                    context
                        .read<PublishBloc>()
                        .add(ImageShowInfoGetInfoEvent(id:id));
                  }

                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(title: Text(title),

                      ),
                      body:
                      state is ImageShowInfoLoadingState ?
                      MyLoadingScreen()
                          :
                      state is ImageShowInfoSuccessState ?
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                PostUserInfo(userName: state.imageInfoModel.data!.userName!, userPhoto: state.imageInfoModel.data!.userProfileImg?? null,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          color : Colors.grey.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
                                          child: Center(
                                            child: Text(state.imageInfoModel.data!.mediaCategory! ,
                                                style: normalTextStyle()
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: SizeConfig.screenHeight!/80,),
                                ImageComponant(imageUrl: "${state.imageInfoModel.data!.imgUrl}"),
                                SizedBox(height: SizeConfig.screenHeight!/80,),
                                ImagePostDescription(description : state.imageInfoModel.data!.description!, photographerName: state.imageInfoModel.data!.photographerName!),
                                ImagePostLike (id :id,likesCount: state.imageInfoModel.data!.likesCount!,isLike: state.imageInfoModel.data!.isLike!),
                                PostTime(time: state.imageInfoModel.data!.createdAt!,date: state.imageInfoModel.data!.createdAtRelative!),
                              ],
                            ),
                          ),
                        ),
                      )
                          :
                      Center(child: Text(
                        "عذراً حصل خطأ ما\n"
                            "الرجاء المحاولة لاحقاً ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),),
                    ),
                  );
                }
            )
        )
    );
  }
}








