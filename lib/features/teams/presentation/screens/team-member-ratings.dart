import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/constant/strings-const.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../core/constant/colors/light-colors.dart';
import '../../data/repository/team_repo.dart';
import '../../domain/bloc/teams-bloc.dart';
import '../../domain/bloc/teams-event.dart';
import '../../domain/bloc/teams-state.dart';
import '../widgets/TeamMemberRatings/member-rating-list-item.dart';
import '../widgets/teams-method.dart';
class TeamMemberRatings extends StatelessWidget {
   TeamMemberRatings({super.key, required this.teamId});
   final int teamId;
  int x= 4;
   final TeamsBloc teamsBloc  = TeamsBloc(teamsRepo: TeamsRepo());

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => teamsBloc,
        child: BlocListener<TeamsBloc, TeamsState>(
            listener: (context, state) {
              if (state is ShowRatingErrorState) {
                teamsErrorCoolAlert(state,context, StringConst.somethingWrong,StringConst.sorry);
              }
            },
            child: BlocBuilder<TeamsBloc, TeamsState>(
                builder: (context, state) {
                  if(state is TeamsInitState) {
                    context.read<TeamsBloc>().add(ShowRatingEvent(id: teamId));

                  }
                  return SafeArea(
                    child: Directionality(
                      textDirection: TextDirection.rtl,

                      child: Scaffold(
                        appBar: AppBar(
                          title: Text("تقييماتي"),
                        ),
                        body: Container(
                            margin: const EdgeInsets.all(20),
                            child:
                            state is ShowRatingLoadingState ?
                            MyLoadingScreen()
                                :
                            state is ShowRatingSuccessState ?

                           SingleChildScrollView(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("محصلة تقييماتي: ",style: normalTextStyle(),),
                                      Text(" ${state.ratingMemberModel.data!.averageRating!}/5 ",style: normalTextStyle(),)
                                    ],
                                  ),
                                  ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context,index) => MemberRatingListItem(
                                        count: state.ratingMemberModel.data!.ratings![0]["ratings"][index]["rating_value"],
                                        date: state.ratingMemberModel.data!.ratings![0]["ratings"][index]["rating_date"],
                                      ),
                                      separatorBuilder: (index,context) => SizedBox(height: 10,),
                                      itemCount: state.ratingMemberModel.data!.ratings![0]["ratings"].length),
                                  SizedBox(height: 20,),
                                  // LinearPercentIndicator(
                                  //   animation: true,
                                  //   animationDuration: 3000, //mille second
                                  //   lineHeight: 20,
                                  //     percent: calculatePercentage(value: state.ratingMemberModel.data!.averageRating!, total: 5), //double value between 0 and 1
                                  //   backgroundColor: Colors.grey.shade100,
                                  //   progressColor: primaryColor,
                                  //   linearStrokeCap: LinearStrokeCap.round,
                                  //   leading: Text("محصلة تقييماتك"),
                                  //   center: Text (
                                  //     "${state.ratingMemberModel.data!.averageRating!}/5",
                                  //     style: TextStyle(
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w500,
                                  //       color: Colors.grey[400],
                                  //     ),
                                  //   ),
                                  // ),

                                ],
                              ),
                           )
                                :
                            Center(child: Text (
                              "عذراً حصل خطأ ما\n""الرجاء المحاولة لاحقاً ",
                              style: normalTextStyle(),),)

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


double calculatePercentage({required double value, required int total}) {
  return (value / total) ;
}
