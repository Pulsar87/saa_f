import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../core/constant/assets-const.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../widgets/admin-publish/show-image-publish-request/show-image-publish-request-list.dart';
import '../../widgets/publish-method.dart';

class ShowImagePublishRequests extends StatelessWidget {
  ShowImagePublishRequests({super.key});

  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
               if (state is ShowImagePublishRequestsErrorState)
                 publishErrorCoolAlert(state, context, "عذراً حصل خطأ ما", "Error");
              },
            child: BlocBuilder<PublishBloc, PublishState>(

                builder: (context, state) {
                  if(state is PublishInitState ) {
                    context
                        .read<PublishBloc>()
                        .add(ShowImagePublishRequestsEvent());
                  }
                  if (state is PublishRefreshState)
                    {
                      context
                          .read<PublishBloc>()
                          .add(ShowImagePublishRequestsEvent());

                      print("PublishRefreshState");
                    }
                  return SafeArea(

                    child: Scaffold(
                      appBar: AppBar(title: Text("الصور الجديدة"),),

                      body:
                      state is ShowImagePublishRequestsLoadingState ?
                      MyLoadingScreen()
                      :
                      state is ShowImagePublishRequestsSuccessState ?
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: state.imageRequestListModel.photos.length == 0?
                          Center(child: Text ("لا يوجد طلبات جديدة",
                            style: normalTextStyle(),))
                              :
                          ShowImagePublishRequestList(imgList: state.imageRequestListModel.photos),
                      )
                  :
                      state is ShowImagePublishRequestsErrorState ?
                  Center(child: Text (
                    "عذراً حصل خطأ ما\n"
                        "الرجاء المحاولة لاحقاً ",
                    style: normalTextStyle(),
                  ),)
                      :
                  SizedBox(),

                  ),
                  );
                }
            )
        )
    );
  }
}






