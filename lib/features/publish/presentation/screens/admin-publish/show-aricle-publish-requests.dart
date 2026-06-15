import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../publish/data/repository/publish_repo.dart';
import '../../../../publish/domain/bloc/publish-bloc.dart';
import '../../../../publish/domain/bloc/publish-event.dart';
import '../../../../publish/domain/bloc/publish-state.dart';
import '../../widgets/admin-publish/show-image-publish-request/show-image-publish-request-list.dart';
import '../../widgets/article/admin-article-request/aricle-publish-requests-list.dart';

class ShowArticlePublishRequests extends StatelessWidget {
  ShowArticlePublishRequests({super.key});

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
                  if(state is PublishInitState ) {
                    context
                        .read<PublishBloc>()
                        .add(ShowArticlePublishRequestsEvent());
                  }
                  if(state is PublishRefreshState) {
                    print("object");
                    context
                        .read<PublishBloc>()
                        .add(ShowArticlePublishRequestsEvent());

                  }
                  return SafeArea(
                    child: Scaffold(
                      appBar: AppBar(title: Text("المقالات الجديدة"),),
                      body:
                      state is ShowArticlePublishRequestsLoadingState ?
                      MyLoadingScreen()
                          :
                      // ArticlePublishRequestList(),

                      state is ShowArticlePublishRequestsSuccessState ?
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: state.articleRequestListModel.articleList.length == 0?
                          Center(child: Text ("لا يوجد طلبات جديدة",
                            style: normalTextStyle(),))
                              :
                          ArticlePublishRequestList(articleList: state.articleRequestListModel.articleList),

                          // ShowImagePublishRequestList(imgList: state.imageRequestListModel.photos),
                      )
                       :
                      Center(
                        child:
                        Text (
                        "عذراً حصل خطأ ما\n"
                            "الرجاء المحاولة لاحقاً",
                        style: normalTextStyle(),
                      ),
                      ),
                    ),
                  );
                }
            )
        )
    );
  }
}








