
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_event.dart';

import '../../../../core/components/screen_componant/loading_screen.dart';
import '../../../../core/constant/strings-const.dart';
import '../../../../core/router/animation_route.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/repository/activity_repo.dart';
import '../../domain/bloc/activity_bloc.dart';
import '../../domain/bloc/activity_state.dart';
import '../method/add_success_method.dart';
import '../widgets/get_announced_activities/get_announced_activities_list_item.dart';
import 'activity-photos.dart';
import 'activity_info.dart';

class GetConfirmedActivitiesToUserScreen extends StatelessWidget {
  GetConfirmedActivitiesToUserScreen({super.key});
  final ActivityBloc activityBloc = ActivityBloc(activityRepository: ActivityRepo());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => activityBloc,
        child: BlocListener<ActivityBloc, ActivityState>(listener: (context, state) {
          if (state is GetConfirmedActivitiesErrorState) {
            activityErrorMethod(context,StringConst.somethingWrong,);
          }
          // else if(state is AuthErrorState) {authErrorCoolAlert(context); }
        }, child: BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
          if (state is ActivityInitialState) {
            print("object");
            context.read<ActivityBloc>().add(GetConfirmedActivitiesEvent());
          }

          if (state is GetConfirmedActivitiesLoadingState) {
            return const MyLoadingScreen();
          } else if (state is GetConfirmedActivitiesSuccessState){
            return Scaffold(
              appBar: AppBar(
                title: Text("الأنشطة السابقة"),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                      itemBuilder: (context,index) =>
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MyAnimatedRoute(page: OneActivityInfoScreen(
                                name: state.activityListModel.data![index]['activity_name'],
                                time: state.activityListModel.data![index]['activity_time'],
                                date: state.activityListModel.data![index]['activity_date'],
                                imgUrl: state.activityListModel.data![index]['img_url'],
                                age: state.activityListModel.data![index]['age'],
                                description: state.activityListModel.data![index]['description'],
                                Activivtyimges: state.activityListModel.data![index]['images']?? [],
                                // place: state.activityListModel.data![index]['place'],
                              )));

                            },
                            // onTap: () {
                            //   Navigator.of(context).push(
                            //       MyAnimatedRoute(
                            //       page: ActivityPhotoScreen(
                            //         imgUrl: state.activityListModel.data![index]['img_url'],
                            //         id: state.activityListModel.data![index]['id'],
                            //         name:state.activityListModel.data![index]['activity_name'],
                            //         age: state.activityListModel.data![index]['age'],
                            //       )))
                            //       .then((value) =>
                            //       {
                            //         context.read<ActivityBloc>().add(GetConfirmedActivitiesEvent())
                            //
                            //   }
                            //   );
                            // },

                            child: GetAnnouncedActivitiesListItem(
                              img: state.activityListModel.data![index]['img_url'],
                              title: state.activityListModel.data![index]['activity_name'],
                              date: state.activityListModel.data![index]['activity_date'],
                              age: state.activityListModel.data![index]['age'],
                              description: state.activityListModel.data![index]['description'],
                              id: state.activityListModel.data![index]['id'],
                            ),
                          ),
                      separatorBuilder: (context,index) => SizedBox(height: 10,),
                      itemCount: state.activityListModel.data!.length)
              ),
            );
          }else {
            return Scaffold(body:  Center(child: Text("عذراً، حصل خطأ ما",style: normalTextStyle(),),),);
          }
        })));

  }
}
