import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/assets-const.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/constant/responsive/MediaQuery.dart';
import 'package:saa_f/core/themes/text_style.dart';
import 'package:saa_f/features/activity/domain/bloc/activity_state.dart';

import '../../../../core/constant/app-const.dart';
import '../../../../core/router/animation_route.dart';
import '../../../activity/data/repository/activity_repo.dart';
import '../../../activity/domain/bloc/activity_bloc.dart';
import '../../../activity/domain/bloc/activity_event.dart';
import '../../../activity/presentation/screens/get_announced_activities_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../activity/presentation/screens/get_confirmd_activities_screen_to_user.dart';
class HomeConfirmActivityList extends StatelessWidget {
  HomeConfirmActivityList({super.key});
  ActivityBloc activityBloc = ActivityBloc(activityRepository: ActivityRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => activityBloc,
        child: BlocListener<ActivityBloc, ActivityState>(
            listener: (context, state) {
              print(state);
              if (state is GetConfirmedActivitiesSuccessState) {
                // PublishBloc.imageGalleryCategory = state.category;
                ActivityBloc.homeConfirmedActivity.clear();
                ActivityBloc.homeConfirmedActivity.addAll(state.activityListModel.data!);
                print(ActivityBloc.homeConfirmedActivity.length);
              }
            }, child: BlocBuilder<ActivityBloc, ActivityState>(builder: (context, state) {
          if (state is ActivityInitialState) {
            context.read<ActivityBloc>().add(GetConfirmedActivitiesEvent());
          }
          if (state is GetConfirmedActivitiesLoadingState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          else if (state is GetConfirmedActivitiesErrorState)  {
            return Text("حصل خطأ");
          }
          else {
            if (ActivityBloc.homeConfirmedActivity.length == 0) {
              return Container();

            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MyAnimatedRoute(page: GetConfirmedActivitiesToUserScreen()));
                      },
                      child: Text("نشاطاتنا",style: normalTextStyle(color: primaryColor,fontSize: 15),)),
                  Container(
                    height: 200,
                    child: ListView.separated(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Container(
                              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                              width: SizeConfig.screenWidth!-SizeConfig.screenWidth!/5,
                              // width: 50,
                              // height: 20,
                              child: Image.network("${AppConst.imgUrl}${ActivityBloc.homeConfirmedActivity[index]['img_url']}",fit: BoxFit.cover),
                            ),
                        separatorBuilder: (context, index) => SizedBox(width: 20,),
                        itemCount: ActivityBloc.homeConfirmedActivity.length<3 ? ActivityBloc.homeConfirmedActivity.length : 3),
                  ),
                ],
              );
            }
          }
        }
        )
        )
    );

  }
}
