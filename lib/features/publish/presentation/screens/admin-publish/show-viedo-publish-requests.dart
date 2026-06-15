
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/themes/text_style.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../widgets/admin-publish/show-video-publish-request/show-video-publish-request-list.dart';
import '../../widgets/publish-method.dart';

class ShowVideoPublishRequests extends StatelessWidget {
  ShowVideoPublishRequests({super.key});

  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
               if (state is ShowVideoPublishRequestsErrorState)
                 publishErrorCoolAlert(state, context, "عذراً حصل خطأ ما", "Error");

              },
            child: BlocBuilder<PublishBloc, PublishState>(

                builder: (context, state) {

                  if(state is PublishInitState ) {
                    context
                        .read<PublishBloc>()
                        .add(ShowVideoPublishRequestsEvent());
                  }
                  if (state is PublishRefreshState){
                    print("PublishRefreshState");
                    context
                        .read<PublishBloc>()
                        .add(ShowVideoPublishRequestsEvent());

                  }
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(title: Text("الفيديوهات الجديدة"),),

                      body:
                      state is ShowVideoPublishRequestsLoadingState ?
                        MyLoadingScreen()
                            :
                      state is ShowVideoPublishRequestsSuccessState ?
                        Container(
                        margin: const EdgeInsets.all(10),
                          child:
                        state.videoListModel.video.length == 0?
                        Center(child: Text ("لا يوجد طلبات جديدة",
                          style: normalTextStyle(),))
                            :
                            ShowVideoPublishRequestList(videoList: state.videoListModel.video),


                      )
                       :
                          state is ShowVideoPublishRequestsErrorState?
                           Center(child: Text (
                             "عذراً حصل خطأ ما\n"
                                 "الرجاء المحاولة لاحقاً",
                             style: normalTextStyle(),
                           ),)
                  :
                              SizedBox()
                    ),
                  );
                }
            )
        )
    );
  }
}







